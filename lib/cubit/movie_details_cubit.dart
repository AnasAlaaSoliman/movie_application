import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/movie_details_model.dart';
import '../service/movie_api.dart';
import '../service/similar_movie_api.dart';
import 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {

  MovieDetailsCubit() : super(MovieDetailsInitial());

  Future<void> getMovieDetails(int movieId) async {

    try {

      emit(MovieDetailsLoading());

      final movie =
      await MovieApi.getMovieDetails(movieId);

      final similar =
      await SimilarMovieApi.getSimilarMovies(movieId);

      emit(MovieDetailsLoaded(
        movie: movie,
        similarMovies: similar,
      ));

    } catch (e) {

      emit(MovieDetailsError(e.toString()));

    }

  }
}