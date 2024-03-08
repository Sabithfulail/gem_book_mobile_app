import 'package:flutter/material.dart';
import 'package:gem_book/features/presentation/widgets/btn_component.dart';
import 'package:gem_book/units/app_images.dart';
import 'package:gem_book/units/app_strings.dart';
import 'package:sizer/sizer.dart';
import '../../../../units/routes.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
            SizedBox(height: 5.h),
            BtnComponent(
              title: AppStrings.login,
              color: Colors.grey,
              onTap: () {
                Navigator.popUntil(context, ModalRoute.withName(Routes.kLoginView));
              },
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
