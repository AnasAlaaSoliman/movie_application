import 'package:flutter/material.dart';

class Cast  extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Text(
        "Cast",
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}