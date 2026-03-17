import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:movie2_application/cubit/movie_details_cubit.dart';
import 'package:movie2_application/cubit/movie_details_state.dart';
import 'package:movie2_application/cubit/watchListCubit.dart';
import '../../models/movie_details_model.dart';

class Details extends StatelessWidget {
  final MovieDetailsModel movies;

  const Details({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        height: 650,
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.network(movies.poster, fit: BoxFit.cover),
            ),

            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Bounceable(
                  onTap: () {
                    final movie =
                        (context.read<MovieDetailsCubit>().state
                                as MovieDetailsLoaded).movie;
                        context.read<WatchListCubit>().addMovie(movie);
                  },
                  child: Icon(Icons.bookmark, color: Colors.white, size: 30),
                ),
              ),
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Text(
                  movies.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
