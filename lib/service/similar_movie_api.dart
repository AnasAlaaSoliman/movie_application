import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/movie_details_model.dart';

class SimilarMovieApi {

  static Future<List<MovieDetailsModel>> getSimilarMovies(int movieId) async {

    final url =
        "https://movies-api.accel.li/api/v2/movie_suggestions.json?movie_id=$movieId";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {

      final data = json.decode(response.body);

      List movies = data["data"]["movies"];

      return movies.map((e) => MovieDetailsModel.fromJson({
        "data": {"movie": e}
      })).toList();

    } else {
      throw Exception("Failed to load similar movies");
    }
  }
}