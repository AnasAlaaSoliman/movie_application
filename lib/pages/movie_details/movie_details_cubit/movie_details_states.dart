import 'package:movie2_application/models/movie_data_model.dart';

sealed class MovieDetailsStates {}

class MovieDetailsInitialState extends MovieDetailsStates {}

class MovieDetailsLoadingIState extends MovieDetailsStates {}

class MovieDetailsSuccessState extends MovieDetailsStates {
  MovieData movie;

  MovieDetailsSuccessState(this.movie);
}

class MovieDetailsErrorState extends MovieDetailsStates {
  String errorMessage;

  MovieDetailsErrorState({required this.errorMessage});
}
