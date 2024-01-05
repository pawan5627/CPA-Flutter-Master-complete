import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cpa/export.dart';

class CPATheme {
  final CPAColorTheme _ColorTheme;
  final CPATextTheme _TextTheme;

  CPATheme({
    CPAColorTheme? ColorTheme,
    CPATextTheme? TextTheme,
  })  : _TextTheme = TextTheme ?? CPATextTheme(),
        _ColorTheme = ColorTheme ?? CPAColorTheme();

  ThemeData get data => ThemeData(
        primaryColor: _ColorTheme.primarygolden,
        fontFamily: _TextTheme.fontFamily,
        colorScheme: colorScheme,
        appBarTheme: appBarTheme,
        scaffoldBackgroundColor: Colors.white,
        textButtonTheme: textButtonThemeData,
      );

  ColorScheme get colorScheme => const ColorScheme.light().copyWith(
        primary: _ColorTheme.primarygolden,
        secondary: _ColorTheme.primaryblue,
        background: _ColorTheme.black,
        surface: _ColorTheme.white,
      );

  TextButtonThemeData get textButtonThemeData => TextButtonThemeData(
        style: ButtonStyle(
          overlayColor:
              MaterialStateProperty.all(const Color.fromARGB(18, 0, 0, 0)),
          shape: MaterialStateProperty.all(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
          ),
        ),
      );

  AppBarTheme get appBarTheme => AppBarTheme(
        backgroundColor: Colors.transparent,
        foregroundColor: _ColorTheme.white,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Color.fromARGB(20, 0, 0, 0),
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: Colors.transparent,
          systemNavigationBarDividerColor: Colors.transparent,
        ),
        elevation: 0,
      );
}
