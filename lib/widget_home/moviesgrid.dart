import 'package:flutter/material.dart';
import 'movie_card.dart';

class MoviesGrid extends StatelessWidget {
  final List movies;

  const MoviesGrid({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(), // عشان عندك Scroll فوق
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: movies.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // 👈 3 جنب بعض
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.6, // يتحكم في الطول
      ),
      itemBuilder: (context, index) {
        final movie = movies[index];

        return MovieCard(
          imagePath: movie['medium_cover_image'],
          rating: (movie['rating'] ?? 0).toDouble(),
        );
      },
    );
  }
}