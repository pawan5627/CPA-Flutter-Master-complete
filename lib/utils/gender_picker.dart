import 'package:flutter/material.dart';

import '../constants/color_theme.dart';

// ignore: must_be_immutable
class GenderDropdown extends StatefulWidget {
  String? selectedValue;

  GenderDropdown({Key? key, this.selectedValue = "Gender"}) : super(key: key);

  @override
  _GenderDropdownState createState() => _GenderDropdownState();
}

class _GenderDropdownState extends State<GenderDropdown> {
  List<String> genderOptions = ['Gender', 'Male', 'Female', 'Others'];

  @override
  Widget build(BuildContext context) {
    if (!genderOptions.contains(widget.selectedValue)) {
      widget.selectedValue = 'Gender';
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        DropdownButtonFormField<String>(
          value: widget.selectedValue,
          onChanged: (String? newValue) {
            setState(() {
              widget.selectedValue = newValue!;
            });
          },
          items: genderOptions.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[200],
            labelStyle: TextStyle(
              color: CPAColorTheme().primaryblue,
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          hint: Text(widget.selectedValue!,),
        ),
      ],
    );
  }
}
