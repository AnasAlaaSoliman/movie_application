import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie2_application/core/route/route_name.dart';
import 'package:movie2_application/pages/movie_details/movie_details_screen.dart';
import '../../cubit/movie_details_cubit.dart';
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

      case RouteName.movie_details_screen:

        final movieId = settings.arguments as int;

        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (_) => MovieDetailsCubit()
              ..getMovieDetails(movieId),
            child: MovieDetailsScreen(
              movieId: movieId,
            ),
          ),
        );
    }
  }
}
