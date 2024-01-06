import 'package:cpa/constants/color_theme.dart';
import 'package:cpa/constants/text_theme.dart';
import 'package:flutter/material.dart';

class CustomInfoContainer extends StatelessWidget {
  final String variableText;
  final String iconPath;
  final String infoText;

  CustomInfoContainer({
    Key? key,
    required this.variableText,
    required this.iconPath,
    required this.infoText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CPAColorTheme().white,
        borderRadius: BorderRadius.circular(1.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      height: 90,
      width: 190,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(iconPath),
          SizedBox(width: 8),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 28),
              Text(
                variableText,
                style: CPATextTheme().heading6.copyWith(
                      color: CPAColorTheme().black,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              Text(
                infoText,
                style: CPATextTheme().small.copyWith(
                      color: CPAColorTheme().black,
                      fontWeight: FontWeight.normal,
                    ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
