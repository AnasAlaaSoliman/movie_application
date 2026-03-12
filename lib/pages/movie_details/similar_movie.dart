import 'package:flutter/material.dart';
import 'package:movie2_application/core/theme/color_pallete.dart';
import '../../models/movie_details_model.dart';
import '../home_screen/widget_home/movie_card.dart';

class SimilarMovie extends StatelessWidget {

  final List<MovieDetailsModel> movies;

  const SimilarMovie({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(
          "Similar",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: ColorPallete.white,
          ),
        ),

        SizedBox(height: 11),

       /* GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: movies.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 14,
            mainAxisSpacing: 14,
            childAspectRatio: 0.65,
          ),
          itemBuilder: (context, index) {

            final movie = movies[index];

            return MovieCard(
              imagePath: movie.movieImage ?? "",
              rating: movie.rating ?? 0,
              movieId: movie.id ?? 0,

            );
          },

        ),
        */
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: movies.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 14,
            mainAxisSpacing: 14,
            childAspectRatio: 0.65,
          ),
          itemBuilder: (context, index) {
            final movie = movies[index];

            return MovieCard(
              imagePath: movie.poster, // بدل movieImage
              rating: movie.rating,
              movieId: movie.id,
            );
          },
        ),


      ],
    );
  }

}