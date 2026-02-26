import 'package:flutter/material.dart';
import 'package:movie_app/core/route/route_name.dart';
import 'package:movie_app/pages/profile_page.dart';

import '../../pages/onboarding/onboarding_screen.dart';

abstract class AppRouters {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.profile_page:
        return MaterialPageRoute(builder: (context) => ProfilePage());
      case RouteName.onboarding_page:
        return MaterialPageRoute(builder: (context) => OnboardingScreen());
      default:MaterialPageRoute(builder: (context) => ProfilePage());
    }
  }
}
