/*import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie2_application/pages/movie_details/similar_movie.dart';
import 'package:movie2_application/pages/movie_details/summary.dart';
import '../../core/theme/color_pallete.dart' show ColorPallete;
import '../../cubit/movie_details_cubit.dart';
import '../../cubit/movie_details_state.dart';
import '../../customWidget/cast_custom_widget.dart';
import 'cast.dart';
import 'genres_movie.dart';
class MovieDetailsScreen extends StatefulWidget {
  final int movieId;
  const MovieDetailsScreen({super.key, required this.movieId});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.black,
      appBar: AppBar(title: Text("Movie Details")),
      body: BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
        builder: (context, state) {

          if (state is MovieDetailsLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is MovieDetailsError) {
            return const Center(child: Text("Error loading movie"));
          }

          if (state is MovieDetailsLoaded) {

            final movie = state.movie;
            final similar = state.similarMovies;

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  /// Similar
                  SimilarMovie(movies: similar),

                  /// Summary
                  Summary(movie: movie),

                  /// Cast
                  Cast(),

                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
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

                  /// Genres
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: GenresMovie(
                      genres: movie.movieGenres ?? [],
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            );
          }

          return const SizedBox();
        },
      )
    );
  }
}


 */
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie2_application/pages/movie_details/similar_movie.dart';
import 'package:movie2_application/pages/movie_details/summary.dart';
import 'package:movie2_application/pages/movie_details/upper_part.dart';
import '../../core/theme/color_pallete.dart' show ColorPallete;
import '../../cubit/movie_details_cubit.dart';
import '../../cubit/movie_details_state.dart';
import '../../customWidget/cast_custom_widget.dart';
import 'cast.dart';
import 'genres_movie.dart';

class MovieDetailsScreen extends StatefulWidget {
  final int movieId;
  const MovieDetailsScreen({super.key, required this.movieId});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.black,
      appBar: AppBar(title: const Text("Movie Details")),
      body: BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
        builder: (context, state) {
          if (state is MovieDetailsLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is MovieDetailsError) {
            return Center(child: Text(state.message));
          }

          if (state is MovieDetailsLoaded) {
            final movie = state.movie;
            final similar = state.similarMovies;

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  /// === هذا الجزء الخاص بزميلك ===
                  MovieDetailsUI(movie: movie),

                  const SizedBox(height: 16),

                  /// Summary
                  Summary(movie: movie),

                  const SizedBox(height: 16),

                  /// Cast
                  Cast(),
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

                  const SizedBox(height: 16),

                  /// Genres
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: GenresMovie(genres: movie.movieGenres ?? []),
                  ),

                  const SizedBox(height: 16),

                  /// Similar Movies
                  SimilarMovie(movies: similar),

                  const SizedBox(height: 20),
                ],
              ),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}