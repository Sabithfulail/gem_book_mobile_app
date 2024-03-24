import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../utils/app_strings.dart';
import '../../widgets/btn_component.dart';
import '../../widgets/common_appbar.dart';
import '../../widgets/common_snack_bar.dart';
import '../../widgets/custom_textfield.dart';


class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  String email = '';
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const CommonAppBar(
        title: "Forgot Password",
      ),
      body: Container(
        margin: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Enter your mail to send rest password",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 3.h),
            CustomTextField(
              labelText: "",
              hintText: AppStrings.enterEmailAddress,
              onChanged: (value) {
                email = value;
              },
            ),
            SizedBox(height: 3.h),
            BtnComponent(
              onTap: () {
                forgotPassword(email);
              },
              title: "Send reset Link",
            ),
          ],
        ),
      ),
    );
  }

  Future<void> forgotPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: email,
      );
      CustomSnackBar.show(context, 'Password reset email sent! Please check your inbox.');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        CustomSnackBar.show(context, 'No user found for that email.');
      } else {
        CustomSnackBar.show(context, 'Error resetting password: ${e.message}');
      }
    }
  }

}


