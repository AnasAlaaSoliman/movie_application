import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie2_application/models/movie_details_model.dart';

class Historycubit extends Cubit<List<MovieDetailsModel>> {
  Historycubit():super([]);

  void addHistory(MovieDetailsModel movie){
    final current= List<MovieDetailsModel>.from(state);
    current.add(movie);
    emit(current);
  }

}