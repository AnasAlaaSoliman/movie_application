import 'package:flutter/material.dart';
import 'package:movie_app/core/route/route_name.dart';
import 'package:movie_app/pages/profile_page.dart';
import 'package:movie_app/screens/auth_screens/forget_password/forget_password_screen.dart';
import 'package:movie_app/screens/home_screen.dart';


import '../../pages/onboarding/onboarding_screen.dart';
import '../../screens/auth_screens/login/login_screen.dart';
import '../../screens/auth_screens/register/register_screen.dart';

abstract class AppRouters {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.profile_page:
        return MaterialPageRoute(builder: (context) => ProfilePage());
      case RouteName.onboarding_page:
        return MaterialPageRoute(builder: (context) => OnboardingScreen());
      case RouteName.home_page:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case RouteName.login:
        return MaterialPageRoute(builder: (context) => LoginScreen());
      case RouteName.forget_password:
        return MaterialPageRoute(builder: (context) => ForgetPasswordScreen());
    case RouteName.register:
    return MaterialPageRoute(builder: (context) => RegisterScreen());
      default:MaterialPageRoute(builder: (context) => ProfilePage());
    }
  }
}
