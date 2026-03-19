import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/movie_details_model.dart';

class Summary extends StatelessWidget {
  final MovieDetailsModel movie;

  const Summary({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        SizedBox(height: 20),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            "Summary",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        SizedBox(height: 8),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            movie.overview,
            style: TextStyle(
              color: Colors.white70,
              fontSize: 16,
            ),
          ),
        ),

      ],
    );
  }
}
