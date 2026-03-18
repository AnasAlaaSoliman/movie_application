import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:movie2_application/pages/movie_details/movie_details_screen.dart';

import '../../../core/route/route_name.dart';
class MovieCard extends StatelessWidget {
  final String imagePath;
  final double rating;
  final int movieId; // ← مهم

  const MovieCard({
    super.key,
    required this.imagePath,
    required this.rating,
    required this.movieId,
  });

  @override
  Widget build(BuildContext context) {
    return Bounceable(
      onTap: () {
        Navigator.pushNamed(
          context,
          RouteName.movie_details_screen,
          arguments: movieId, // ← هنا بعت الـ ID
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 16),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              Image.network(
                imagePath,
                fit: BoxFit.cover,
              ),
              // Rating
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
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