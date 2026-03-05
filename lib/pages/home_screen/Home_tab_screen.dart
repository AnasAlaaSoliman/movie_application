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
      backgroundColor: ColorPallete.background,
      body: BlocBuilder<MovieCubit, MovieState>(
        builder: (context, state) {

          if (state is MovieLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is MovieSuccess) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  HomeBanner(movies: state.movies),

                  const SizedBox(height: 30),

                  const SectionTitle(title: "Action"),

                  const SizedBox(height: 20),

                  MoviesGrid(movies: state.movies),

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