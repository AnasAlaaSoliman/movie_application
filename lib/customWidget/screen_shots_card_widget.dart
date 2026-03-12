import 'package:flutter/material.dart';

class ScreenShotsCardWidget extends StatelessWidget {
  final String imagePath;
  const ScreenShotsCardWidget({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      width:double.infinity ,
      height: 167,
      decoration:BoxDecoration(
          image: DecorationImage(image:NetworkImage(imagePath),fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(16)
      ),
    );
  }
}