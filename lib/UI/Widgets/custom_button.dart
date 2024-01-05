import 'package:flutter/material.dart';
import 'package:cpa/export.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton({
    Key? key,
    required this.buttonText,
    required this.onPressed,
    this.isActive = true,
    this.isOutlined = false,
    this.isIconButton = false,
    this.icon = Icons.abc,
    this.iconSize = 24.0,
    this.leftIcon = true,
    this.color,
    this.textColor,
  }) : super(key: key);

  String buttonText;
  final Function onPressed;
  Size buttonSize = const Size(0, 0);
  final bool isActive;
  final bool isOutlined;
  final bool isIconButton;
  final IconData icon;
  final double iconSize;
  final bool leftIcon;
  final Color? color;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    buttonSize = Size(MediaQuery.of(context).size.width * 1, 41);
    return isOutlined
        ? TextButton(
            onPressed: isActive
                ? () {
                    onPressed();
                  }
                : () {},
            style: TextButton.styleFrom(
              backgroundColor: isActive
                  ? CPAColorTheme().white
                  : CPAColorTheme().primaryblue,
              primary: textColor, // Text color
              minimumSize: buttonSize,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // Radius of 10
                side: BorderSide(
                  width: 1.0,
                  color: CPAColorTheme().primaryblue,
                ),
              ),
            ),
            child: isIconButton
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      leftIcon
                          ? Icon(
                              icon,
                              size: iconSize,
                            )
                          : const SizedBox(),
                      leftIcon ? const SizedBox(width: 8.0) : const SizedBox(),
                      Text(
                        buttonText,
                        style: isActive
                            ? CPATextTheme()
                                .heading5
                                .copyWith(color: CPAColorTheme().primaryblue)
                            : CPATextTheme()
                                .heading6
                                .copyWith(color: CPAColorTheme().primaryblue),
                      ),
                      leftIcon ? const SizedBox() : const SizedBox(width: 8.0),
                      leftIcon
                          ? const SizedBox()
                          : Icon(
                              icon,
                              size: iconSize,
                            ),
                    ],
                  )
                : Text(
                    buttonText,
                    style: isActive
                        ? CPATextTheme()
                            .heading6
                            .copyWith(color: CPAColorTheme().primaryblue)
                        : CPATextTheme()
                            .heading6
                            .copyWith(color: CPAColorTheme().primaryblue),
                  ),
          )
        : TextButton(
            onPressed: isActive
                ? () {
                    onPressed();
                  }
                : () {},
            style: TextButton.styleFrom(
              backgroundColor: isActive
                  ? color ?? CPAColorTheme().primaryblue
                  : CPAColorTheme().neutral700,
              primary: textColor, // Text color
              minimumSize: buttonSize,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // Radius of 10
              ),
            ),
            child: isIconButton
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      leftIcon
                          ? Icon(
                              icon,
                              size: iconSize,
                            )
                          : const SizedBox(),
                      leftIcon ? const SizedBox(width: 8.0) : const SizedBox(),
                      Text(
                        buttonText,
                        style: isActive
                            ? CPATextTheme().heading6.copyWith(
                                  color: textColor ?? CPAColorTheme().white,
                                )
                            : CPATextTheme().heading6.copyWith(
                                  color:
                                      textColor ?? CPAColorTheme().primaryblue,
                                ),
                      ),
                      leftIcon ? const SizedBox() : const SizedBox(width: 8.0),
                      leftIcon
                          ? const SizedBox()
                          : Icon(
                              icon,
                              size: iconSize,
                            ),
                    ],
                  )
                : Text(
                    buttonText,
                    style: isActive
                        ? CPATextTheme()
                            .heading6
                            .copyWith(color: CPAColorTheme().white)
                        : CPATextTheme()
                            .heading6
                            .copyWith(color: CPAColorTheme().primaryblue),
                  ),
          );
  }
}
