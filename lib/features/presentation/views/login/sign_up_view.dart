import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_strings.dart';
import '../../../../utils/routes.dart';
import '../../widgets/common_snack_bar.dart';
import '../../widgets/custom_textfield.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  String firstName = '';
  String lastName = '';
  String contactNumber = '';
  String emailAddress = '';
  String userName = '';
  String password = '';
  String conformPassword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(3.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Column(
                children: <Widget>[
                  const SizedBox(height: 60.0),
                  const Text(
                    "Sign up",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Create your account",
                    style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  CustomTextField(
                    labelText: AppStrings.firstName,
                    hintText: AppStrings.enterFirstName,
                    fillColor: AppColors.baseColor,
                    onChanged: (value) {
                      setState(() {
                        firstName = value;
                      });
                    },
                  ),
                  SizedBox(height: 3.h),
                  CustomTextField(
                    labelText: AppStrings.lastName,
                    hintText: AppStrings.enterLastName,
                    fillColor: AppColors.baseColor,
                    onChanged: (value) {
                      setState(() {
                        lastName = value;
                      });
                    },
                  ),
                  SizedBox(height: 3.h),
                  CustomTextField(
                    labelText: AppStrings.contactNumber,
                    hintText: AppStrings.contactNumber,
                    fillColor: AppColors.baseColor,
                    onChanged: (value) {
                      setState(() {
                        contactNumber = value;
                      });
                    },
                  ),
                  SizedBox(height: 3.h),
                  CustomTextField(
                    labelText: AppStrings.emailAddress,
                    hintText: AppStrings.enterEmailAddress,
                    fillColor: AppColors.baseColor,
                    onChanged: (value) {
                      setState(() {
                        emailAddress = value;
                      });
                    },
                  ),
                  SizedBox(height: 3.h),
                  CustomTextField(
                    labelText: AppStrings.userName,
                    hintText: AppStrings.enterUserName,
                    fillColor: AppColors.baseColor,
                    onChanged: (value) {
                      setState(() {
                        userName = value;
                      });
                    },
                  ),
                  SizedBox(height: 3.h),
                  CustomTextField(
                    labelText: AppStrings.password,
                    hintText: AppStrings.enterPassword,
                    fillColor: AppColors.baseColor,
                    onChanged: (value) {
                      setState(() {
                        password = value;
                      });
                    },
                  ),
                  SizedBox(height: 3.h),
                  CustomTextField(
                    labelText: AppStrings.conformPassword,
                    hintText: AppStrings.reEnterPassword,
                    fillColor: AppColors.baseColor,
                    onChanged: (value) {
                      setState(() {
                        conformPassword = value;
                      });
                    },
                  ),
                  SizedBox(height: 3.h),
                ],
              ),
              Container(
                  padding: const EdgeInsets.only(top: 3, left: 3),
                  child: ElevatedButton(
                    onPressed: () {
                      if (firstName.isEmpty ||
                          lastName.isEmpty ||
                          contactNumber.isEmpty ||
                          emailAddress.isEmpty ||
                          userName.isEmpty ||
                          password.isEmpty ||
                          conformPassword.isEmpty) {
                        CustomSnackBar.show(context, 'Please fill all details');
                      }else{
                        if(password == conformPassword){
                          Navigator.pushNamed(context, Routes.kHomeView);
                        }else{
                          CustomSnackBar.show(context, 'Password are not same');
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: AppColors.baseColor,
                    ),
                    child: const Text(
                      "Sign up",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  )),
              Padding(
                padding: EdgeInsets.only(top: 2.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text("Already have an account?"),
                    TextButton(
                        onPressed: () {
                          Navigator.popUntil(
                              context, ModalRoute.withName(Routes.kLoginView));
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(color: AppColors.baseColor),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
