abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchSuccess extends SearchState {
  final List movies;

  SearchSuccess(this.movies);
}

class SearchError extends SearchState {}