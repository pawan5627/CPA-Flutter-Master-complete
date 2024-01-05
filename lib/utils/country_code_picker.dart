import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../constants/color_theme.dart';

class PhoneDropdown extends StatelessWidget {
  final TextEditingController phoneController;

  const PhoneDropdown({Key? key, required this.phoneController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      controller: phoneController,
      initialCountryCode: 'US',
      decoration: InputDecoration(
        labelText: 'Phone Number',
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
    );
  }
}
