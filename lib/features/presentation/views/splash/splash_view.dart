import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:gem_book/units/app_images.dart';
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
    Timer(const Duration(seconds: 10), () => Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginView()), // Replace with your login view widget
    ));
  }

  @override
  Widget build(BuildContext context) {
    return     AnnotatedRegion(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: Container(
          decoration:  const BoxDecoration(
              gradient:  LinearGradient(
                colors: [Colors.purple, Color(0xFFE7E7E7)],
                stops: [0.0, 1.0],
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
              )),
          child:  Center(
            child: Container(
              height: 14.h,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(50),
                  
                ),
              ),
              child: Image(
                image: AssetImage(AppImages.icGem),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
