import 'package:flutter/material.dart';
import 'package:gem_book/features/presentation/widgets/btn_component.dart';
import 'package:gem_book/utils/app_images.dart';
import 'package:gem_book/utils/app_strings.dart';
import 'package:sizer/sizer.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 5.h,
                  ),
                  Container(
                    height: 40.h,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          AppImages.intoImg,
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    "${AppStrings.welcome} ${AppStrings.to}\n${AppStrings.gemBook}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 40,
                    ),
                  ),
                  SizedBox(height: 5.h,),
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse",
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
           const BtnComponent(title: "Login"),
            const SizedBox(
              height: 8,
            ),
            const BtnComponent(
              title: "Register",
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
