import 'package:flutter/material.dart';

import '../../customWidget/cast_custom_widget.dart';
import '../../models/movie_details_model.dart';

class Cast  extends StatelessWidget{
  final MovieDetailsModel movie;
  const Cast({super.key, required this.movie});


  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Cast",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),


          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: movie.cast.length,
            itemBuilder: (context, index) {
              final actor = movie.cast[index];

              return CastCustomWidget(
                nameActor: actor.name,
                character: actor.character,
                profilePath: actor.profilePath,
              );
            },
          ),
        ],
      ),
    );
  }
}