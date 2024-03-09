import 'package:flutter/material.dart';
import 'package:gem_book/features/presentation/widgets/custom_textfield.dart';
import 'package:gem_book/utils/app_strings.dart';

import '../../../../units/app_colors.dart';
import '../../../../units/routes.dart';
import '../../../../utils/app_colors.dart';
import '../../widgets/btn_component.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  final bool obscurePassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _header(context),
            _inputField(context),
            _forgotPassword(context),
            _signup(context),
          ],
        ),
      ),
    );
  }

  _header(context) {
    return const Column(
      children: [
        Text(
          "${AppStrings.welcome} ${AppStrings.back}",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        Text(AppStrings.enterCredentials),
      ],
    );
  }

  _inputField(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const CustomTextField(
          hintText: AppStrings.userName,
          icon: Icon(Icons.person),
        ),
        // TextField(
        //   decoration: InputDecoration(
        //       hintText: "Username",
        //       border: OutlineInputBorder(
        //           borderRadius: BorderRadius.circular(18),
        //           borderSide: BorderSide.none),
        //       fillColor: AppColors.baseColor.withOpacity(0.1),
        //       filled: true,
        //       prefixIcon: const Icon(Icons.person)),
        // ),
        const SizedBox(height: 10),
        CustomTextField(
          hintText: AppStrings.password,
          icon: Icon(Icons.remove_red_eye),
          obscureText: obscurePassword,
        ),
        // TextField(
        //   decoration: InputDecoration(
        //     hintText: "Password",
        //     border: OutlineInputBorder(
        //         borderRadius: BorderRadius.circular(18),
        //         borderSide: BorderSide.none),
        //     fillColor: AppColors.baseColor.withOpacity(0.1),
        //     filled: true,
        //     prefixIcon: const Icon(Icons.password),
        //   ),
        //   obscureText: true,
        // ),
        const SizedBox(height: 10),
        const BtnComponent(
          title: AppStrings.login,
          onTap: () {
            Navigator.pushNamed(context, Routes.kHomeView);
          },

        ),
        // ElevatedButton(
        //   onPressed: () {
        //     Navigator.pushReplacement(
        //       context,
        //       MaterialPageRoute(
        //           builder: (context) =>
        //               const HomeView()), // Replace with your login view widget
        //     );
        //   },
        //   style: ElevatedButton.styleFrom(
        //     shape: const StadiumBorder(),
        //     padding: const EdgeInsets.symmetric(vertical: 16),
        //     backgroundColor: AppColors.baseColor,
        //   ),
        //   child: const Text(
        //     "Login",
        //     style: TextStyle(fontSize: 20, color: Colors.white),
        //   ),
        // )
      ],
    );
  }

  _forgotPassword(context) {
    return TextButton(
      onPressed: () {},
      child: const Text(
        "${AppStrings.forgotPassword}?",
        style: TextStyle(color: AppColors.baseColor),
      ),
    );
  }

  _signup(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Dont have an account? "),
        TextButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                Routes.kIntroPage);
            },
            child: const Text(
              "Sign Up",
              style: TextStyle(color: AppColors.baseColor),
            ))
      ],
    );
  }
}
