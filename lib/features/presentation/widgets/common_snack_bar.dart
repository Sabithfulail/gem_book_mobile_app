import 'package:flutter/material.dart';

class CustomSnackBar {
  final String message;
  final Color backgroundColor;
  final SnackBarBehavior behavior;
  final Duration duration;

  CustomSnackBar({
    required this.message,
    this.backgroundColor = const Color(0xff002538), // Default background color
    this.behavior = SnackBarBehavior.floating,
    this.duration = const Duration(seconds: 1), // Default duration
  });

  static void show(BuildContext context, String message,
      {Color backgroundColor = const Color(0xff002538),
        SnackBarBehavior behavior = SnackBarBehavior.floating,
        Duration duration = const Duration(seconds: 1)}) {
    final snackBar = SnackBar(
      backgroundColor: backgroundColor,
      behavior: behavior,
      duration: duration,
      content: Text(message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
