import 'package:flutter/material.dart';
import 'package:gem_book/features/presentation/views/login/login_view.dart';

import '../features/presentation/views/home_view/home_view.dart';
import '../features/presentation/views/intro/intro_page.dart';
import '../features/presentation/views/login/sign_up_view.dart';
import '../features/presentation/views/splash/splash_view.dart';



class Routes {
  static const String kSplashView = 'kSplashView';
  static const String kLoginView = 'kLoginView';
  static const String kHomeView = 'kHomeView';
  static const String kSignUpView = 'kSignUpView';
  static const String kIntroPage = 'kIntroPage';




  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name){

      case Routes.kSplashView:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
          settings: const RouteSettings(name: kSplashView),
        );
      case Routes.kLoginView:
        return MaterialPageRoute(
          builder: (_) => const LoginView(),
          settings: const RouteSettings(name: kLoginView),
        );
      case Routes.kHomeView:
        return MaterialPageRoute(
          builder: (_) => const HomeView(),
          settings: const RouteSettings(name: kHomeView),
        );
      case Routes.kSignUpView:
        return MaterialPageRoute(
          builder: (_) => const SignUpView(),
          settings: const RouteSettings(name: kSignUpView),
        );
      case Routes.kIntroPage:
        return MaterialPageRoute(
          builder: (_) => const IntroPage(),
          settings: const RouteSettings(name: kIntroPage),
        );



      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text("Invalid Route"),
            ),
          ),
        );
    }
  }
}


