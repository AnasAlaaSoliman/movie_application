import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie2_application/models/movie_data_model.dart';
import 'package:movie2_application/pages/movie_details/movie_details_cubit/movie_details_states.dart';

import '../../../network_handler/network_handler.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsStates> {
  int movieId;
  MovieDetailsCubit({required this.movieId})
    : super(MovieDetailsInitialState())

  {
    getMovieDetails(movieId);
  }
  Future<void> getMovieDetails(int movieId) async {
    try {
      emit(MovieDetailsLoadingIState());
      final MovieData movie = await NetworkHandler.getMovie(movieId);
      emit(MovieDetailsSuccessState(movie));

    } catch (error) {
      emit(MovieDetailsErrorState( errorMessage: error.toString()));

    }
  }
}
