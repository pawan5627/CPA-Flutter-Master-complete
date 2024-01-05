import 'package:cpa/export.dart';
import 'package:flutter/material.dart';

class CPATextTheme {
  CPATextTheme({
    this.fontFamily = "Times New Roman",
  }) : _baseTextStyle = TextStyle(
            fontFamily: fontFamily,
            fontWeight: FontWeights.regular,
            height: 1.2,
            color: CPAColorTheme().neutral900);

  final String fontFamily;
  final TextStyle _baseTextStyle;

  TextStyle get heading1 => _baseTextStyle.copyWith(
        fontSize: 36.0,
        fontWeight: FontWeights.semiBold,
      );

  TextStyle get heading2 => _baseTextStyle.copyWith(
        fontSize: 32.0,
        fontWeight: FontWeights.semiBold,
      );

  TextStyle get heading3 => _baseTextStyle.copyWith(
        fontSize: 28.0,
        fontWeight: FontWeights.semiBold,
      );

  TextStyle get heading4 => _baseTextStyle.copyWith(
        fontSize: 24.0,
        fontWeight: FontWeights.semiBold,
      );

  TextStyle get heading5 => _baseTextStyle.copyWith(
        fontSize: 20.0,
        fontWeight: FontWeights.semiBold,
      );

  TextStyle get heading6 => _baseTextStyle.copyWith(
        fontSize: 18.0,
        fontWeight: FontWeights.semiBold,
      );

  TextStyle get body => _baseTextStyle.copyWith(
        fontSize: 14.0,
        fontWeight: FontWeights.regular,
      );

  TextStyle get subtext => _baseTextStyle.copyWith(
        fontSize: 16.0,
        fontWeight: FontWeights.medium,
      );
  TextStyle get headline => _baseTextStyle.copyWith(
        fontSize: 14.0,
        fontWeight: FontWeights.bold,
      );
  TextStyle get small => _baseTextStyle.copyWith(
        fontSize: 11.0,
        fontWeight: FontWeights.regular,
      );
  TextStyle get extrasmall => _baseTextStyle.copyWith(
        fontSize: 8.0,
        letterSpacing: 0.36,
        fontWeight: FontWeights.regular,
      );
  TextStyle get body1 => _baseTextStyle.copyWith(
        fontSize: 13.5,
        fontWeight: FontWeights.semiBold,
      );

  // TextStyle get small => _baseTextStyle.copyWith(
  //     fontSize: 16.0,
  //     fontWeight: FontWeights.regular,
  //     color: PreMedColorTheme().neutral400
  //     // color: PreMedColorTheme().standardwhite
  //     );
}

extension FontWeights on FontWeight {
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
}
