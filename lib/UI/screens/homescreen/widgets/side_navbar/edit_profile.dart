import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cpa/UI/screens/profilesetup/widgets/dob.dart';
import 'package:cpa/export.dart';
import 'package:cpa/utils/country_code_picker.dart';
import 'package:cpa/utils/gender_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class EditProfile extends StatefulWidget {
  final String? uid;
  File? image;

  EditProfile({Key? key, this.image, this.uid}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _nickNameController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _numberController = TextEditingController();

  String? uid;
  GenderDropdown genderDropdown =
      GenderDropdown(selectedValue: 'DefaultGender');

  File? pickedImage;

  @override
  void initState() {
    haveUid();
    getUid();

    super.initState();
  }

  Future<String?> haveUid() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString('uid');
  }

  void getUid() async {
    uid = await haveUid();
    setState(() {});
    print("--------------- UID ----------------------------");
    print(uid);
  }

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        pickedImage = File(pickedFile.path);
        widget.image = pickedImage; // Update widget.image here
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: FutureBuilder<DocumentSnapshot>(
              future: users.doc(uid).get(),
              builder: (BuildContext context,
                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (!snapshot.hasData ||
                    snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (snapshot.hasData) {
                  Map<String, dynamic>? data =
                      snapshot.data?.data() as Map<String, dynamic>?;

                  _nameController.text = data?['f_name'] ?? '';
                  _nickNameController.text = data?['nickname'] ?? '';
                  _dateController.text = data?['dob'] ?? '';
                  _numberController.text = data?['number'] ?? '';
                  genderDropdown.selectedValue =
                      data?['gender'] ?? 'DefaultGender';

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SideNavbar(),
                                ),
                              );
                            },
                            icon: const Icon(Icons.arrow_back_ios),
                          ),
                          Text(
                            'Edit Profile',
                            textAlign: TextAlign.center,
                            style: CPATextTheme().small.copyWith(
                                  color: CPAColorTheme().black,
                                  fontSize: 18,
                                  fontFamily: 'Red Hat Display',
                                  fontWeight: FontWeight.w600,
                                  height: 0,
                                ),
                          )
                        ],
                      ),
                      Center(
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            InkWell(
                              onTap: () {
                                _pickImage();
                              },
                              child: Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black,
                                ),
                                child:
                                    pickedImage != null || widget.image != null
                                        ? ClipOval(
                                            child: Image.file(
                                              pickedImage ?? widget.image!,
                                              fit: BoxFit.cover,
                                              width: 100,
                                              height: 100,
                                            ),
                                          )
                                        : Icon(
                                            Icons.person,
                                            color: Colors.white,
                                            size: 50,
                                          ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                _pickImage();
                              },
                              child: Container(
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.blue,
                                ),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBoxes.verticalBig,
                      CustomTextField(
                          controller: _nameController, hintText: 'Name'),
                      SizedBoxes.verticalMedium,
                      CustomTextField(
                          controller: _nickNameController,
                          hintText: 'Nickname'),
                      SizedBoxes.verticalMedium,
                      _dateController.text == " "
                          ? DateOfBirthWidget(dateController: _dateController)
                          : Text(_dateController.text),
                      SizedBoxes.verticalMedium,
                      PhoneDropdown(phoneController: _numberController),
                      Align(
                        alignment: Alignment.topLeft,
                        child: genderDropdown,
                      ),
                      SizedBoxes.verticalExtraGargangua,
                      SizedBoxes.verticalExtraGargangua,
                      SizedBoxes.verticalExtraGargangua,
                      SizedBoxes.verticalExtraGargangua,
                      CustomButton(
                        buttonText: 'Update',
                        onPressed: () async {
                          await users.doc(uid).update({
                            'f_name': _nameController.text,
                            'nickname': _nickNameController.text,
                            'dob': _dateController.text,
                            'number': _numberController.text,
                            'gender': genderDropdown.selectedValue,
                            // 'imgUrl': pickedImage
                            // Add other fields as needed
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SideNavbar(uid: uid),
                            ),
                          );
                        },
                      ),
                    ],
                  );
                } else {
                  return Center(
                    child: Text("Error: Something went wrong"),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
