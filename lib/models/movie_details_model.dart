/*import 'actormodel.dart';

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

 */


import 'actormodel.dart';

class MovieDetailsModel {
  final int id;
  final String title;
  final String overview;
  final double rating;
  final String poster;
  final List<ActorModel> cast;
  List<String>? movieGenres;

  // إضافات من Model زميلك
  final String urlLink;
  final int runTime;
  final int likeCount;
  final String mediumScreenshotImage1;
  final String mediumScreenshotImage2;
  final String mediumScreenshotImage3;
  final String largeScreenshotImage1;
  final String largeScreenshotImage2;
  final String largeScreenshotImage3;

  MovieDetailsModel({
    required this.id,
    required this.title,
    required this.overview,
    required this.rating,
    required this.poster,
    required this.cast,
    this.movieGenres,
    required this.urlLink,
    required this.runTime,
    required this.likeCount,
    required this.mediumScreenshotImage1,
    required this.mediumScreenshotImage2,
    required this.mediumScreenshotImage3,
    required this.largeScreenshotImage1,
    required this.largeScreenshotImage2,
    required this.largeScreenshotImage3,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    final movieData = json['data']['movie'];

    return MovieDetailsModel(
      id: movieData['id'],
      title: movieData['title_long'] ?? '',
      overview: movieData['description_full'] ?? movieData['description_intro'] ?? '',
      rating: (movieData['rating'] ?? 0).toDouble(),
      poster: movieData['medium_cover_image'] ?? '',
      cast: (movieData['cast'] as List<dynamic>?)
          ?.map((c) => ActorModel.fromJson(c))
          .toList() ??
          [],
      movieGenres: List<String>.from(movieData["genres"] ?? []),

      urlLink: movieData['url'] ?? '',
      runTime: movieData['runtime'] ?? 0,
      likeCount: movieData['like_count'] ?? 0,
      mediumScreenshotImage1: movieData['medium_screenshot_image1'] ?? '',
      mediumScreenshotImage2: movieData['medium_screenshot_image2'] ?? '',
      mediumScreenshotImage3: movieData['medium_screenshot_image3'] ?? '',
      largeScreenshotImage1: movieData['large_screenshot_image1'] ?? '',
      largeScreenshotImage2: movieData['large_screenshot_image2'] ?? '',
      largeScreenshotImage3: movieData['large_screenshot_image3'] ?? '',
    );
  }
}
