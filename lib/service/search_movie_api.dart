import 'dart:convert';
import 'package:http/http.dart' as http;

class SearchMovieApi {

  static Future<List> searchMovies(String query) async {

    final url =
        "https://movies-api.accel.li/api/v2/list_movies.json?query_term=$query";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {

      final data = jsonDecode(response.body);

      return data["data"]["movies"] ?? [];

    } else {

      throw Exception("Failed to load movies");

    }
  }
}