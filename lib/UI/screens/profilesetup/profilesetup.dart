import 'dart:io';
import 'package:cpa/UI/screens/profilesetup/widgets/local_image_screen.dart';
import 'package:flutter/material.dart';
import 'package:cpa/UI/screens/profilesetup/widgets/dob.dart';
import 'package:cpa/data/dummy.dart';
import 'package:cpa/export.dart';
import 'package:cpa/services/auth_services.dart';
import 'package:cpa/utils/country_code_picker.dart';
import 'package:cpa/utils/gender_picker.dart';

class ProfileSetup extends StatefulWidget {
  final String? uid;

  const ProfileSetup({
    Key? key,
    required this.uid,
  }) : super(key: key);

  @override
  State<ProfileSetup> createState() => _ProfileSetupState();
}

class _ProfileSetupState extends State<ProfileSetup> {
  bool isSignUp = false;
  bool isProcessing = false;

  TextEditingController _nameController = TextEditingController();
  final TextEditingController _nickNameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void initState() {
    _nameController = TextEditingController(text: fName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(children: [
          Positioned(
            bottom: 0,
            child: Image.asset(
              'assets/Framebg.png',
              width: MediaQuery.of(context).size.width, // Make it full-width
              height: MediaQuery.of(context).size.height *
                  0.45, // Adjust the height as needed
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      'Signup',
                      textAlign: TextAlign.center,
                      style: CPATextTheme().small.copyWith(
                          color: CPAColorTheme().black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          height: 0),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: LocalImagePicker(),
                  ),
                  SizedBoxes.verticalBig,
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'Name', // Label text

                      filled: true, // Enable filling
                      fillColor: Colors.grey[200], // Grey background color
                      labelStyle: CPATextTheme().body.copyWith(
                            fontSize: 20,
                            color: CPAColorTheme()
                                .primaryblue, // Set the label text color
                          ),
                      border: OutlineInputBorder(
                        // Rectangle border
                        borderSide: BorderSide.none, // Remove the border
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  SizedBoxes.verticalMedium,
                  TextField(
                    controller: _nickNameController,
                    decoration: InputDecoration(
                      labelText: 'Nickname', // Label text

                      filled: true, // Enable filling
                      fillColor: Colors.grey[200], // Grey background color
                      labelStyle: CPATextTheme().body.copyWith(
                            fontSize: 20,
                            color: CPAColorTheme()
                                .primaryblue, // Set the label text color
                          ),
                      border: OutlineInputBorder(
                        // Rectangle border
                        borderSide: BorderSide.none, // Remove the border
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  SizedBoxes.verticalMedium,
                  DateOfBirthWidget(dateController: _dateController),
                  SizedBoxes.verticalMedium,
                  PhoneDropdown(phoneController: _phoneController),
                  GenderDropdown(),
                  SizedBoxes.verticalExtraGargangua,
                  SizedBoxes.verticalExtraGargangua,
                  SizedBoxes.verticalExtraGargangua,
                  SizedBoxes.verticalExtraGargangua,
                  isProcessing
                      ? Center(child: CircularProgressIndicator())
                      : CustomButton(
                          buttonText: 'Continue',
                          onPressed: () async {
                            setState(() {
                              isProcessing = true;
                            });

                            if (profileImg == null) {
                              // User has not selected an image, show an error message
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text('Incomplete Information'),
                                  content: Text(
                                      'Please fill in all the required fields.'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('OK'),
                                    ),
                                  ],
                                ),
                              );

                              setState(() {
                                isProcessing = false;
                              });
                            } else {
                              if (profileImg != null) {
                                File profile = File(profileImg!);
                                await AuthServices.uploadImage(
                                    profile, widget.uid);
                              }

                              uid = widget.uid;

                              if (uid == null ||
                                  profileImg == null ||
                                  _nickNameController == null ||
                                  _dateController == null ||
                                  gender == null ||
                                  number == null ||
                                  _nameController == null) {
                                await AuthServices.addUser(
                                  name: _nameController.text.toString(),
                                  nickname: _nickNameController.text.toString(),
                                  dob: _dateController.text.toString(),
                                  uid: uid!,
                                  gender: gender,
                                  imgUrl: imgUrl,
                                  number: _phoneController.text.toString(),
                                  changeCounter: 0,
                                );
                                print("___________________________________");
                                print(fName);
                                print(fAddress);
                                print("====-----${foodAllergies}");
                                print(cpaLong);
                                print('no of adults are: $noOfAdults');
                                print('no of Children are: $noOfChildren ');

                                print("_______________________________");
                                print('pets is $pets');
                                print('livingStyle is $livingStyle');
                                print('landSize is $landSize');
                                print('noOfVehicle is $noOfVehicle');
                                print('interested is $interested');

                                print("-----------------------");
                                print(basicTechnology);
                                print(invest);
                                print(communication);

                                print("_________________________");

                                print(secondaryLocation);
                                print(secLandSize);
                                print(safeRoom);
                                print(personalsDocuments);

                                print("____________________________");
                                print(alternateTransport);
                                print(empdisaster);
                                print(getNotify);

                                print("uid of this user is: $uid");

                                // Move Navigator inside the else block
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomeScreen(
                                      uid: uid!,
                                    ),
                                  ),
                                );
                              } else {
                                print('Error: widget.uid is null or empty.');
                              }
                            }
                          },
                        ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
