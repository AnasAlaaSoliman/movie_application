import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/movie_details_model.dart';

class WatchListCubit extends Cubit<List<MovieDetailsModel>>{
  WatchListCubit(): super([]);


  void addMovie(MovieDetailsModel movie){
    if(!state.any((m) => m.id == movie.id)){
    final current = List<MovieDetailsModel>.from(state);
    current.add(movie);
    emit(current);}
  }

  void removeMovie(MovieDetailsModel movie){
    final current = List<MovieDetailsModel>.from(state);
    current.remove(movie);
    emit(current);
  }

}