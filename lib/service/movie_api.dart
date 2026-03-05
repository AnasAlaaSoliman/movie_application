// movie_api.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/movie_details_model.dart';

class MovieApi {
  static Future<MovieDetailsModel> getMovieDetails(int movieId) async {
    final url = "https://movies-api.accel.li/api/v2/movie_details.json?movie_id=$movieId&with_cast=true";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return MovieDetailsModel.fromJson(data);
    } else {
      throw Exception("Failed to load movie details");
    }
  }
}