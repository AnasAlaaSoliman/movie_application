import 'package:flutter/material.dart';
import 'package:movie2_application/core/route/route_name.dart';
import '../../pages/Profile/profile.dart';
import '../../pages/auth_screens/forget_password/forget_password_screen.dart';
import '../../pages/auth_screens/login/login_screen.dart';
import '../../pages/auth_screens/register/register_screen.dart';
import '../../pages/home_screen/navigationbar.dart';
import '../../pages/onboarding/onboarding_screen.dart';

abstract class AppRouters {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
    case RouteName.profile_page:
    return MaterialPageRoute(builder: (context) => Profile());


    case RouteName.onboarding_page:
    return MaterialPageRoute(builder: (context) => OnboardingScreen());

    case RouteName.navigation_screen:
    return MaterialPageRoute(builder: (context) => NavigationbarScreen());

    case RouteName.login:
    return MaterialPageRoute(builder: (context) => LoginScreen());

    case RouteName.forget_password:
    return MaterialPageRoute(builder: (context) => ForgetPasswordScreen());

    case RouteName.register:
    return MaterialPageRoute(builder: (context) => RegisterScreen());



    }
  }
}
