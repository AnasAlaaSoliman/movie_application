import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/color_pallete.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("home",textAlign: TextAlign.center, style: TextStyle(color: ColorPallete.yellow,fontSize: 80)),
    );
  }
}
