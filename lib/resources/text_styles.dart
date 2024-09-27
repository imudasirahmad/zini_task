import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zini_task/resources/app_color.dart';

TextStyle montserratBold({required double size}) {
  return GoogleFonts.montserrat(
    textStyle: TextStyle(
      color: AppColor.secondaryColor,
    ),
    fontSize: size,
    fontWeight: FontWeight.bold,
  );
}

TextStyle montserrat({ required Color color , required double size}) {
  return GoogleFonts.montserrat(
    textStyle: TextStyle(
      color: color,
    ),
    fontSize: size,
    fontWeight: FontWeight.normal,
  );
}

TextStyle acme({required Color color ,required double size}) {
  return GoogleFonts.acme(
    textStyle: TextStyle(
      color: color,
    ),
    fontSize: size,
    fontWeight: FontWeight.normal,
  );
}
