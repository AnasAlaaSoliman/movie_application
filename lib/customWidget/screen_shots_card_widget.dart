import 'package:flutter/cupertino.dart';

class ScreenShotsCardWidget extends StatelessWidget {
  final String imagePath;

  const ScreenShotsCardWidget({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
      width: 250,
      height: 167,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: NetworkImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}