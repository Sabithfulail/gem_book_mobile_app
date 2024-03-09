import 'package:flutter/material.dart';

class AppColors {
  // Font Colors
  static const Color baseColor = Colors.black87;
  static const Color appWhiteColor = Colors.white;
  static const Color appTextGrayColor = Colors.black54;

  static  LinearGradient primaryGradient =
  LinearGradient(colors: [baseColor.withOpacity(.7),baseColor]);

  static const LinearGradient appBarGradient =
  LinearGradient(colors: [Color(0x00070808), Color(0xFF072F85)]);
}
