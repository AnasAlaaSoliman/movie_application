import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:movie2_application/cubit/historyCubit.dart';
import 'core/route/app_routers.dart';
import 'core/route/route_name.dart';
import 'cubit/movie_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'cubit/watchListCubit.dart';
import 'firebase_options.dart';



void main()async{
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Future.delayed(const Duration(seconds: 3));
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);


  FlutterNativeSplash.remove();
  runApp(
    BlocProvider(
      create: (context) => MovieCubit()..getMovies(),

      child:MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => WatchListCubit()),
          BlocProvider(create: (_) => Historycubit())
        ],
        child:const MyApp(),
      ),
    ),


  );

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: RouteName.navigation_screen,
      onGenerateRoute: AppRouters.onGenerateRoute,

    );
  }
}