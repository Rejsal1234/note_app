import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_app/utils/color.dart';
import 'package:note_app/utils/size.dart';

ThemeData darkTheme = ThemeData.dark(useMaterial3: false).copyWith(
  scaffoldBackgroundColor: darkBg,
  primaryColor: darkPrimaryAndLightBgColor,
  textTheme: TextTheme(
    bodyLarge: GoogleFonts.openSans(
        fontSize: fs32,
        color: darkPrimaryAndLightBgColor,
        fontWeight: FontWeight.w700),
    titleLarge:
        GoogleFonts.openSans(fontSize: fs16, color: darkPrimaryAndLightBgColor),
    titleMedium:
        GoogleFonts.openSans(fontSize: fs14, color: darkPrimaryAndLightBgColor),
    titleSmall:
        GoogleFonts.openSans(fontSize: fs12, color: darkPrimaryAndLightBgColor),
  ),
);

ThemeData lightTheme = ThemeData.light(useMaterial3: false).copyWith(
  scaffoldBackgroundColor: Colors.white,
  primaryColor: lightThemePrimaryColor,
  textTheme: TextTheme(
    bodyLarge: GoogleFonts.openSans(
        fontSize: fs32,
        color: lightThemePrimaryColor,
        fontWeight: FontWeight.bold),
    titleLarge: GoogleFonts.openSans(
      fontSize: fs16,
      color: lightThemePrimaryColor,
    ),
    titleMedium: GoogleFonts.openSans(
      fontSize: fs14,
      color: lightThemePrimaryColor,
    ),
    titleSmall: GoogleFonts.openSans(
      fontSize: fs12,
      color: lightThemePrimaryColor,
    ),
  ),
);

InputDecoration decoration(BuildContext context, String content) {
  return InputDecoration(
    fillColor: textFieldColor,
    hintText: content,
    errorStyle:
        Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.red),
    hintStyle:
        Theme.of(context).textTheme.titleLarge?.copyWith(color: lightTextColor),
    filled: true,
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6.0), borderSide: BorderSide.none),
    errorBorder: const OutlineInputBorder(
      borderSide: BorderSide(width: 1, color: Colors.red),
    ),
  );
}
