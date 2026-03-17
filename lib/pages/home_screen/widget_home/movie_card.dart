import 'package:flutter/material.dart';
<<<<<<< dalia_feature
import 'package:movie2_application/core/route/route_name.dart';
=======
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:movie2_application/pages/movie_details/movie_details_screen.dart';
>>>>>>> develop

import '../../../core/route/route_name.dart';
class MovieCard extends StatelessWidget {
<<<<<<< dalia_feature
  // final String imagePath;
  // final double rating;
  final Map<String, dynamic> movie;

  const MovieCard({
    super.key, required this.movie,

=======
  final String imagePath;
  final double rating;
  final int movieId; // ← مهم

  const MovieCard({
    super.key,
    required this.imagePath,
    required this.rating,
    required this.movieId,
>>>>>>> develop
  });

  @override
  Widget build(BuildContext context) {
<<<<<<< dalia_feature

    final String imagePath=movie['medium_cover_image'];
    final double rating=(movie['rating'] ?? 0).toDouble();
    return InkWell(
      onTap: () {
        final movieId = movie['id'] as int?;
        Navigator.pushNamed(
          context,
          RouteName.movieDetails,
          arguments: movieId
=======
    return Bounceable(
      onTap: () {
        Navigator.pushNamed(
          context,
          RouteName.movie_details_screen,
          arguments: movieId, // ← هنا بعت الـ ID
>>>>>>> develop
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 16),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
<<<<<<< dalia_feature
              Image.network(imagePath, fit: BoxFit.cover),

              /// ⭐ Rating
=======
              Image.network(
                imagePath,
                fit: BoxFit.cover,
              ),
              // Rating
>>>>>>> develop
              Positioned(
                top: 8,
                left: 8,
                child: Container(
<<<<<<< dalia_feature
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 3,
                  ),
=======
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
>>>>>>> develop
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow, size: 14),
                      SizedBox(width: 4),
                      Text(
                        rating.toString(),
                        style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
