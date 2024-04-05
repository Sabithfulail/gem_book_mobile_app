import 'package:flutter/material.dart';

class AppColors {
  // Font Colors
  static const Color baseColor = Colors.black87;
  static const Color appWhiteColor = Colors.white;
  static const Color appTextGrayColor = Colors.black54;
  static const Color appLightGrayColor = Color(0xffA7ABAD);
  static const Color appBlackColor = Colors.black;
  static const Color appTextDarkGray =Colors.black87;
  static const Color appTextFieldFillColor = Color(0xffF0F2F3);
  static const Color appSummaryTextDarkBlueColor = Color(0xff002538);
  static const Color appContainerRedColor = Color(0x59ff5555);
  static const Color appRedColor = Colors.red;


  static  LinearGradient primaryGradient =
  LinearGradient(colors: [baseColor.withOpacity(.7),baseColor]);

  static const LinearGradient appBarGradient =
  LinearGradient(colors: [Color(0x00070808), Color(0xFF072F85)]);
}
