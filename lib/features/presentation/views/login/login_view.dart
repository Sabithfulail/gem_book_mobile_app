import 'dart:convert';
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:gem_book/features/presentation/widgets/custom_textfield.dart';
import 'package:gem_book/utils/app_strings.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/routes.dart';
import '../../widgets/btn_component.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final bool obscurePassword = true;
  String userName = "";
  String pwd = "";


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
         CustomTextField(
          hintText: AppStrings.userName,
          icon: const Icon(Icons.person),
          onChanged: (value){
            userName = value;
          },

        ),
        const SizedBox(height: 10),
        CustomTextField(
          hintText: AppStrings.password,
          icon: const Icon(Icons.remove_red_eye),
          obscureText: obscurePassword,
          onChanged: (value){
            pwd = value;
          },
        ),
        const SizedBox(height: 10),
        BtnComponent(
          title: AppStrings.login,
          onTap: () {
            Navigator.pushNamed(context, Routes.kHomeView);
            // login();
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

  showProgressBar(BuildContext? context) {
      showGeneralDialog(
          context: context!,
          barrierDismissible: false,
          transitionBuilder: (context, a1, a2, widget) {
            return PopScope(
              canPop: false,
              child: Transform.scale(
                scale: a1.value,
                child: Opacity(
                  opacity: a1.value,
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                    child: Container(
                      alignment: FractionalOffset.center,
                      child: Wrap(
                        children: [
                          Container(
                            color: Colors.transparent,
                            // child: SpinKitThreeBounce(
                            //   color: source.baseColor,
                            // ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
          transitionDuration: const Duration(milliseconds: 200),
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return const SizedBox.shrink();
          });

  }


  Future<void> login() async {
    showProgressBar(context);
    final username =userName;
    final password =pwd;

    // Create the request body
    final body = jsonEncode({
      'username': username,
      'password': password,
    });

    try {
      final response = await http.post(
        Uri.parse('https://dummyjson.com/auth/login'),
        headers: {'Content-Type': 'application/json'},
        body: body,
      );

      if (response.statusCode == 200) {
        if (kDebugMode) {
          print('Login successful!');
        }
        Navigator.pushNamed(context, '/home'); // Assuming a home screen
      } else {
        if (kDebugMode) {
          print('Login failed: ${response.statusCode}');
        }
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Login failed!'),
          ),
        );
      }
    } catch (error) {
      if (kDebugMode) {
        print('Error logging in: $error');
      }
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('An error occurred. Please try again.'),
        ),
      );
    } finally {
      Navigator.pop(context);
    }
  }
}
