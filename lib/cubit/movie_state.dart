import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;

abstract class MovieState {}

class MovieInitial extends MovieState {}
class MovieLoading extends MovieState {}
class MovieSuccess extends MovieState {
  final List movies;
  MovieSuccess(this.movies);
}
class MovieError extends MovieState {
  final String message;
  MovieError(this.message);
}

class MovieCubit extends Cubit<MovieState> {
  List movies = [];
  int currentIndex = 0;

  MovieCubit() : super(MovieInitial());

  Future<void> getMovies() async {
    emit(MovieLoading());

    try {
      final response = await http.get(
        Uri.parse("https://movies-api.accel.li/api/v2/list_movies.json"),
      );

      final data = jsonDecode(response.body);
      movies = data['data']['movies'] ?? [];

      emit(MovieSuccess(movies));
    } catch (e) {
      emit(MovieError("Something went wrong"));
    }
  }

  // لتغيير الفيلم الحالي
  void changeCurrentIndex(int index) {
    currentIndex = index;
    emit(MovieSuccess(movies)); // إعادة إرسال الـ movies لتحديث UI
  }
}