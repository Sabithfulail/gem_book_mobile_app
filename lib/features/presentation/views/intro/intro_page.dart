import 'package:flutter/material.dart';
import 'package:gem_book/features/presentation/widgets/btn_component.dart';
import 'package:gem_book/units/app_images.dart';
import 'package:gem_book/units/app_strings.dart';
import 'package:sizer/sizer.dart';
import '../../../../units/routes.dart';

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
                  SizedBox(height: 5.h),
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
                  SizedBox(height: 5.h),
                  const Text(
                    AppStrings.introDescription,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            BtnComponent(
              title: AppStrings.login,
              color: Colors.grey,
              onTap: () {
                Navigator.popUntil(context, ModalRoute.withName(Routes.kLoginView));
              },
            ),
            const SizedBox(
              height: 8,
            ),
            BtnComponent(
              title: AppStrings.register,
              onTap: () {
                Navigator.pushNamed(context, Routes.kSignUpView);
              },
            ),
          ],
        ),
      ),
    );
  }
}
