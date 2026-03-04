import 'package:flutter/material.dart';
import 'package:movie2_application/core/route/route_name.dart';
import '../../pages/Profile_screen/profile_page.dart';
import '../../pages/auth_screens/forget_password_screen.dart';
import '../../pages/login/login_screen.dart';
import '../../pages/onboarding/onboarding_screen.dart';

abstract class AppRouters {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.profile_page:
        return MaterialPageRoute(builder: (context) => ProfilePage());


      case RouteName.onboarding_page:
        return MaterialPageRoute(builder: (context) => OnboardingScreen());

      case RouteName.LoginScreen:
        return MaterialPageRoute(builder: (context) => LoginScreen());

      case RouteName.ForgetPassword:
        return MaterialPageRoute(builder: (context) => ForgetPasswordScreen());

      default:MaterialPageRoute(builder: (context) => ProfilePage());
    }
  }
}
