import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Color backgroundRoot=const Color(0xffFAF3E5);

Color defaultColor=const Color(0xffEA6A12);
// Color defaultColor=const Color(0xff5429FF);
Color backgroundRoot=defaultColor.withOpacity(0.1);

Color defaultColor2=const Color(0xffA58FFF);
Color whiteColor=const Color(0xffFFFFFF);
Color greyColor=const Color.fromARGB(255, 135, 140, 142);
Color greyColor2=const Color(0xff959895);
Color greyColor3=const Color(0xffE3E1E1);



TextStyle poppinsTextFont = GoogleFonts.poppins().copyWith(
  color: Colors.black,
  fontSize: 12,
  fontWeight: FontWeight.w300
);
TextStyle playfairDisplayTextFont = GoogleFonts.playfairDisplay().copyWith(
  color: Colors.black,
  fontSize: 12,
  fontWeight: FontWeight.w300
);
TextStyle poppins12_300() {
  return GoogleFonts.getFont('Poppins',fontSize: 12, fontWeight: FontWeight.w300);
}
TextStyle poppins12_500() {
  return GoogleFonts.getFont('Poppins',fontSize: 12, fontWeight: FontWeight.w500);
}

TextStyle poppins14_500() {
  return GoogleFonts.getFont('Poppins',fontSize: 14, fontWeight: FontWeight.w500);
}
TextStyle poppins16_500() {
  return GoogleFonts.getFont('Poppins',fontSize: 16, fontWeight: FontWeight.w500);
}
TextStyle poppins18_500() {
  return GoogleFonts.getFont('Poppins',fontSize: 18, fontWeight: FontWeight.w500);
}
TextStyle poppins20_500() {
  return GoogleFonts.getFont('Poppins',fontSize: 20, fontWeight: FontWeight.w500);
}