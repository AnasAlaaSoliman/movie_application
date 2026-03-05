import 'package:flutter/material.dart';
import 'package:movie2_application/widget_home/feature_carousel.dart';

class HomeBanner extends StatefulWidget {
  final List movies;
  const HomeBanner({super.key, required this.movies});

  @override
  State<HomeBanner> createState() => _HomeBannerState();
}

class _HomeBannerState extends State<HomeBanner> {

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {

    final movie = widget.movies[currentIndex];

    return Stack(
      children: [

        /// 🎬 Dynamic Background
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: Image.network(
            movie['large_cover_image'],
            key: ValueKey(movie['id']),
            height: 650,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),

        /// 🌑 Gradient
        Container(
          height: 650,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.3),
                Colors.black.withOpacity(0.9),
              ],
            ),
          ),
        ),

        SafeArea(
          child: Column(
            children: [

              const SizedBox(height: 20),

              SizedBox(
                height: 420,
                child: FeaturedCarousel(
                  movies: widget.movies,
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}