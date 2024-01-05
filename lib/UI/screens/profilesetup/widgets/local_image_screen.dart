import 'dart:io';
import 'package:cpa/constants/assets.dart';
import 'package:cpa/data/dummy.dart';
import 'package:cpa/export.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class LocalImagePicker extends StatefulWidget {
  @override
  _LocalImagePickerState createState() => _LocalImagePickerState();
}

class _LocalImagePickerState extends State<LocalImagePicker> {
  File? _image;

  Future<void> _pickImage() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        profileImg = pickedFile.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickImage,
      child: Container(
        width: 130,
        height: 130,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: CPAColorTheme().neutral100, // Background color for the circle
        ),
        child: Stack(
          children: <Widget>[
            SizedBoxes.verticalBig,
            Padding(
              padding: EdgeInsets.only(top: 10, left: 7),
              child: Image.asset(
                CPAAssets.ProfileSetup,
                width: 120,
                height: 90,
                fit: BoxFit.contain,
              ),
            ),
            if (_image != null)
              ClipOval(
                child: Image.file(
                  _image!,
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            if (_image == null)
              Align(
                alignment: Alignment.bottomRight,
                child: Image.asset(CPAAssets.ProfileSetupAdd),
              ),
          ],
        ),
      ),
    );
  }
}
