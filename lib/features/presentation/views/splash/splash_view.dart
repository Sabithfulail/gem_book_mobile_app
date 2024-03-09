import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gem_book/utils/app_images.dart';
import 'package:gem_book/units/app_images.dart';
import 'package:gem_book/units/routes.dart';
import 'package:sizer/sizer.dart';

import '../login/login_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacementNamed(context, Routes.kLoginView));
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: Container(
          // decoration: const BoxDecoration(
          //     gradient: LinearGradient(
          //   colors: [AppColors.baseColor, Color(0xFFE7E7E7)],
          //   stops: [0.0, 1.0],
          //   begin: FractionalOffset.topCenter,
          //   end: FractionalOffset.bottomCenter,
          // )),
          child: Center(
            child: Container(
              height: 15.h,
              width: 15.h,
              // decoration: const BoxDecoration(
              //   color: Colors.white,
              //   borderRadius: BorderRadius.all(
              //     Radius.circular(90),
              //   ),
              // ),
              child: Image.asset(
                AppImages.icGem,
                // color: AppColors.baseColor,
                // colorBlendMode: BlendMode.color,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
