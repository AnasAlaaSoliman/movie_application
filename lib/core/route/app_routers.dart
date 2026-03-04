import 'package:flutter/material.dart';

abstract class AppRouters {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.profile_page:
        return MaterialPageRoute(builder: (context) => ProfilePage());
      default:MaterialPageRoute(builder: (context) => ProfilePage());
    }
  }
}
