import 'actormodel.dart';

class MovieDetailsModel {
  final int id;
  final String title;
  final String overview;
  final double rating;
  final String poster;
  final List<ActorModel> cast;
  String? movieSummary;
  String? movieImage;
  List<String>? movieGenres;


  MovieDetailsModel({
    required this.id,
    required this.title,
    required this.overview,
    required this.rating,
    required this.poster,
    required this.cast,
    this.movieGenres,
    this.movieImage,

  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    final movie = json['data']['movie'];

    return MovieDetailsModel(
      id: movie['id'],
      title: movie['title_long'] ?? '',
      overview: movie['description_full'] ?? movie['description_intro'] ?? '',
      rating: (movie['rating'] ?? 0).toDouble(),
      poster: movie['medium_cover_image'] ?? '',

      cast: (movie['cast'] as List<dynamic>?)
          ?.map((c) => ActorModel.fromJson(c))
          .toList() ??
          [],

      movieGenres: List<String>.from(movie["genres"] ?? []),

      movieImage: movie["medium_cover_image"],
    );
  }
  }

  /*factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    final movie = json['data']['movie'];
    return MovieDetailsModel(
      title: movie['title_long'] ?? '',
      overview: movie['description_full'] ?? movie['description_intro'] ?? '',
      rating: (movie['rating'] ?? 0).toDouble(),
      poster: movie['medium_cover_image'] ?? '',
      cast: (movie['cast'] as List<dynamic>?)
          ?.map((c) => ActorModel.fromJson(c))
          .toList() ??
          [],
        movieGenres: List<String>.from(json["genres"]),
        movieImage: json["medium_cover_image"]
    );
  }

   */


