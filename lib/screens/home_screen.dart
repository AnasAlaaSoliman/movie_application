import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Scaffold(
     body: Column(
       children: [
         Image.asset("assets/images/splash_logo.png"),
       ],
     ),

   );
  }

}