import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  MovieCubit() : super(MovieInitial());
  int currentIndex = 0; // ↩️ الفيلم الحالي
  List movies = [];

  Future<void> getMovies() async {
    emit(MovieLoading());

    try {
      final response = await http.get(
        Uri.parse("https://movies-api.accel.li/api/v2/list_movies.json"),
      );

      final data = jsonDecode(response.body);
      final movies = data['data']['movies'];

      emit(MovieSuccess(movies));
    } catch (e) {
      emit(MovieError("Something went wrong"));
    }
  }
  // ↩️ لتغيير الفيلم الحالي
  void changeCurrentIndex(int index) {
    currentIndex = index;
    emit(MovieSuccess(movies)); // إعادة إرسال نفس الـ movies لتحديث الـ UI
  }
}