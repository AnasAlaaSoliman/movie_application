/*import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;

import '../models/movie_model.dart';
import 'movie_state.dart';

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

      final moviesJson = data['data']['movies'] ?? [];///  عشان لو مفيش أفلام يرجع List فاضية.

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

}*/


import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;

import '../models/movie_model.dart';
import 'movie_state.dart';

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

      final moviesJson = data['data']['movies'] ?? [];///  عشان لو مفيش أفلام يرجع List فاضية.

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
  List<String> get categories {
    return movies
        .expand((movie) => movie.genres)
        .map((e) => e.trim())
        .toSet()
        .toList()
      ..sort();
  }
  List<MovieModel> getMoviesByCategory(String category) {
    return movies.where((movie) {
      return movie.genres.any(
            (g) => g.toLowerCase() == category.toLowerCase(),
      );
    }).toList();
  }
}