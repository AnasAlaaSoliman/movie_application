import 'package:flutter/material.dart';
import '../models/movie_details_model.dart';
import '../core/theme/color_pallete.dart';

class CastCustomWidget extends StatelessWidget {
  final String nameActor;
  final String character;
  final String? profilePath;

  const CastCustomWidget({
    super.key,
    required this.nameActor,
    required this.character,
    this.profilePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: ColorPallete.gray,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: profilePath != null
                ? NetworkImage(profilePath!)
                : AssetImage("assets/avatars/incognito.png") as ImageProvider,
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Name: $nameActor",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "Character: $character",
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
