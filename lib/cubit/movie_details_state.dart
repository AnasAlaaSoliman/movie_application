/*import '../models/movie_details_model.dart';

abstract class MovieDetailsState {}

class MovieDetailsInitial extends MovieDetailsState {}

class MovieDetailsLoading extends MovieDetailsState {}

class MovieDetailsLoaded extends MovieDetailsState {
  final MovieDetailsModel movie;
  final List<MovieDetailsModel> similarMovies;

  MovieDetailsLoaded({
    required this.movie,
    required this.similarMovies,
  });
}

class MovieDetailsError extends MovieDetailsState {
  final String message;

  MovieDetailsError(this.message);
}

 */
import '../models/movie_details_model.dart';

abstract class MovieDetailsState {}

class MovieDetailsInitial extends MovieDetailsState {}

class MovieDetailsLoading extends MovieDetailsState {}

class MovieDetailsLoaded extends MovieDetailsState {
  final MovieDetailsModel movie;
  final List<MovieDetailsModel> similarMovies;

  MovieDetailsLoaded({
    required this.movie,
    required this.similarMovies,
  });
}

class MovieDetailsError extends MovieDetailsState {
  final String message;

  MovieDetailsError(this.message);
}