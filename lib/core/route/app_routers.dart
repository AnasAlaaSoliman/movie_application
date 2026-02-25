import 'package:flutter/material.dart';
import 'package:movie_app/core/route/route_name.dart';
import 'package:movie_app/pages/profile_page.dart';

abstract class AppRouters {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.profile_page:
        return MaterialPageRoute(builder: (context) => ProfilePage());
      default:MaterialPageRoute(builder: (context) => ProfilePage());
    }
  }
}
