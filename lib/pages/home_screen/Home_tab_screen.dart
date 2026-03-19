import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie2_application/pages/home_screen/widget_home/home_banner.dart';
import 'package:movie2_application/pages/home_screen/widget_home/moviesgrid.dart';
import 'package:movie2_application/pages/home_screen/widget_home/section_title.dart';
import '../../core/theme/color_pallete.dart';
import '../../cubit/movie_cubit.dart';
import '../../cubit/movie_state.dart' hide MovieCubit;


class HomeTabScreen extends StatelessWidget {
  const HomeTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.black,
      body: BlocBuilder<MovieCubit, MovieState>(
        builder: (context, state) {

          if (state is MovieLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is MovieSuccess) {
            final actionMovies = state.movies
                .where((movie) => movie.genres.contains("Action"))
                .toList();

            final ComedyMovies = state.movies
                .where((movie) => movie.genres.contains("Comedy"))
                .toList();

            final dramaMovies = state.movies
                .where((movie) => movie.genres.contains("Drama"))
                .toList();

            final HorrorMovies = state.movies
                .where((movie) => movie.genres.contains("Horror"))
                .toList();


            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  HomeBanner(movies: state.movies),

                  const SizedBox(height: 30),
                  const SectionTitle(title: "Action"),
                  MoviesGrid(movies: actionMovies),

                  const SizedBox(height: 20),

                  const SectionTitle(title: "Comedy"),
                  const SizedBox(height: 20),
                  MoviesGrid(movies:ComedyMovies),

                  const SizedBox(height: 20),

                  const SectionTitle(title: "Drama"),
                  const SizedBox(height: 20),
                  MoviesGrid(movies: dramaMovies),
                  const SizedBox(height: 20),

                  const SectionTitle(title: "Horror"),
                  const SizedBox(height: 20),
                  MoviesGrid(movies: HorrorMovies),
                  const SizedBox(height: 20),




                ],
              ),
            );
          }

          if (state is MovieError) {
            return const Center(
              child: Text("Error loading movies"),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}