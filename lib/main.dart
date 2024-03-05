import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'features/presentation/views/splash/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
            title: 'Flutter Sizer Example',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const SplashScreen());
      },
    );
  }
}
