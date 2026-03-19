import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;

import '../models/movie_model.dart';

abstract class MovieState {}

class MovieInitial extends MovieState {}

class MovieLoading extends MovieState {}

class MovieSuccess extends MovieState {
  final List<MovieModel> movies;

  MovieSuccess(this.movies);
}

class MovieError extends MovieState {
  final String message;

  MovieError(this.message);
}

class MovieCubit extends Cubit<MovieState> {

  MovieCubit() : super(MovieInitial());

  int currentIndex = 0;

  List<MovieModel> movies = [];

  Future<void> getMovies() async {

    emit(MovieLoading());

    try {

      final response = await http.get(
        Uri.parse("https://movies-api.accel.li/api/v2/list_movies.json"),
      );

      final data = jsonDecode(response.body);

      final moviesJson = data['data']['movies'] ?? [];

      movies = List.from(moviesJson)
          .map((movie) => MovieModel.fromJson(movie))
          .toList();

      emit(MovieSuccess(movies));

    } catch (e) {

      emit(MovieError("Something went wrong"));

    }
  }

  void changeCurrentIndex(int index) {

    currentIndex = index;

    emit(MovieSuccess(movies));

  }
}