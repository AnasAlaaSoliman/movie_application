import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import '../core/theme/color_pallete.dart';

class Moviecard extends StatelessWidget {
  //String rate ='';
  String movieImage = '';

  Moviecard({/*required this.rate,*/ required this.movieImage});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Bounceable(
          onTap: () {},
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              movieImage,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
        ),

        Positioned(
          top: 8,
          left: 8,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.7),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Text(
                  "7.7",
                  style: TextStyle(
                    color: ColorPallete.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 3),
                Icon(Icons.star, color: ColorPallete.yellow, size: 16),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
