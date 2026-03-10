import 'package:flutter/material.dart';
import 'package:movie2_application/core/theme/App_assets.dart';

import '../../../models/movie_model.dart';
import 'feature_carousel.dart';


class HomeBanner extends StatefulWidget {
  final List<MovieModel> movies;
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
          movie.largeCoverImage,
            key: ValueKey(movie.id),
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
            Image.asset("assets/images/Avalable_now.png",fit:BoxFit.cover,),


              const SizedBox(height: 10),

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
              Image.asset("assets/images/watch_now.png",fit:BoxFit.cover,),
            ],
          ),
        ),
      ],
    );
  }
}