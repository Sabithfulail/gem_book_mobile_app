import 'package:flutter/material.dart';
import 'package:gem_book/units/app_constants.dart';
import 'package:gem_book/units/routes.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          title: kAppName,
          theme: ThemeData(primarySwatch: Colors.blue),
          initialRoute: Routes.kSplashView,
          onGenerateRoute: Routes.generateRoute,
        );
      },
    );
  }
}
