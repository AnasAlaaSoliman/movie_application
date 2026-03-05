import 'package:flutter/material.dart';

import '../../../models/movie_model.dart';

class FeaturedCarousel extends StatefulWidget {
  final List<MovieModel> movies;
  final Function(int) onPageChanged;

   const FeaturedCarousel({super.key, required this.movies, required this.onPageChanged});


  @override State<FeaturedCarousel> createState() => _FeaturedCarouselState();
}

class _FeaturedCarouselState extends State<FeaturedCarousel> {
  late PageController _controller;



  @override
  void initState() {
    super.initState();
    _controller = PageController(viewportFraction: 0.7, initialPage: 1000);
  }

  @override
  Widget build(BuildContext context) {
    return  PageView.builder(
        controller: _controller,
        itemCount: 5000,
        onPageChanged: (index) {
          final realIndex = index %widget.movies.length;
          widget.onPageChanged(realIndex);
        },
        itemBuilder: (context, index) {
          final realIndex = index % widget.movies.length;

          return AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              double value = 1.0;

              if (_controller.position.haveDimensions) {
                value = (_controller.page! - index);
                value = (1 - (value.abs() * 0.3)).clamp(0.7, 1.0);
              }

              return Center(
                child: Transform.translate(
                  offset: Offset(0, (1 - value) * 40), // 👈 ينزل اللي على الجنب
                  child: Transform.scale(
                    scale: value, // 👈 يكبر اللي في النص
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Stack(
                          children: [
                            Image.network(
                              widget.movies[realIndex].largeCoverImage,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),

                            /// ⭐ Rating
                            Positioned(
                              top: 12,
                              left: 12,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.7),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child:  Row(
                                  children: [
                                    Icon(Icons.star,
                                        color: Colors.yellow, size: 16),
                                    SizedBox(width: 4),
                                    Text(
                                      (widget.movies[realIndex].rating)
                                          .toStringAsFixed(1),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        });
  }

}