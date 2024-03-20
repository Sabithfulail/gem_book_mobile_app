import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gem_book/features/presentation/views/login/login_view.dart';

import '../features/presentation/views/add_post/add_post_view.dart';
import '../features/presentation/views/contact_us/contact_us.dart';
import '../features/presentation/views/edit_post/edit_post.dart';
import '../features/presentation/views/home_view/home_view.dart';
import '../features/presentation/views/intro/intro_page.dart';
import '../features/presentation/views/login/sign_up_view.dart';
import '../features/presentation/views/notificaation/notification__view.dart';
import '../features/presentation/views/profile/profile_view.dart';
import '../features/presentation/views/splash/splash_view.dart';
import '../features/presentation/widgets/gem_add.dart';
import '../features/presentation/widgets/gem_details_view.dart';



class Routes {
  static const String kSplashView = 'kSplashView';
  static const String kLoginView = 'kLoginView';
  static const String kHomeView = 'kHomeView';
  static const String kSignUpView = 'kSignUpView';
  static const String kIntroPage = 'kIntroPage';
  static const String kContactUsPage = 'kContactUsPage';
  static const String kNotificationView = 'kNotificationView';
  static const String kGemDetailView = 'kGemDetailView';
  static const String kAddPostView = 'kAddPostView';
  static const String kEditPostView = 'kEditPostView';
  static const String kProfileView = 'kProfileView';


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
          builder: (_) =>  HomeView(user: settings.arguments as User,),
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
      case Routes.kContactUsPage:
        return MaterialPageRoute(
          builder: (_) => const ContactUsPage(),
          settings: const RouteSettings(name: kContactUsPage),
        );
      case Routes.kNotificationView:
        return MaterialPageRoute(
          builder: (_) => const NotificationView(),
          settings: const RouteSettings(name: kNotificationView),
        );
      case Routes.kGemDetailView:
        return MaterialPageRoute(
          builder: (_) =>  GemDetailView(
            gemDetailArguments: settings.arguments as GemDetailArguments,
          ),
          settings: const RouteSettings(name: kGemDetailView),
        );
      case Routes.kAddPostView:
        return MaterialPageRoute(
          builder: (_) =>  const AddPostView(),
          settings: const RouteSettings(name: kAddPostView),
        );
      case Routes.kEditPostView:
        return MaterialPageRoute(
          builder: (_) =>   EditPostView(gemAdd: settings.arguments as GemAdd),
          settings: const RouteSettings(name: kEditPostView),
        );
      case Routes.kProfileView:
        return MaterialPageRoute(
          builder: (_) =>   const ProfileView(),
          settings: const RouteSettings(name: kProfileView),
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


