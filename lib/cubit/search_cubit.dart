import 'package:flutter_bloc/flutter_bloc.dart';
import '../service/search_movie_api.dart';
import 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  void searchMovies(String query) async {
    if (query.isEmpty) {
      emit(SearchInitial());
      return;
    }

    emit(SearchLoading());

    try {
      final movies = await SearchMovieApi.searchMovies(query);

      emit(SearchSuccess(movies));
    } catch (e) {
      print(e); // مهم علشان نشوف الخطأ
      emit(SearchError());
    }
  }
}