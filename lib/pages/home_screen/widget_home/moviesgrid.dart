import 'package:flutter/material.dart';
import '../../../models/movie_model.dart';

import 'movie_card.dart';
class MoviesGrid extends StatelessWidget {
  final List<MovieModel> movies;
   MoviesGrid({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: movies.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // 👈 3 جنب بعض
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.6,
      ),
      itemBuilder: (context, index) {
        final movie = movies[index];
        return MovieCard(
          imagePath: movie.mediumCoverImage,
          rating: movie.rating,
          movieId: movie.id, // ← هنا نمرر ID للفيلم
        );
      },
    );
  }
}