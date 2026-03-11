import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie2_application/models/movie_data_model.dart';

import 'api_constants.dart';
import 'endpoints.dart';

class NetworkHandler {
  static Future<MovieData> getMovie(int id) async {
    Map<String, dynamic> queryParameters = {
      'movie_id': id.toString(),
      'with_images': true.toString(),
      'with_cast': true.toString(),
    };
    try {
      final response = await http.get(
        Uri.https(
          ApiConstants.baseUrl,
          Endpoints.movieDetails,
          queryParameters,
        ),
      );
     // print(response.body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        //print(data['data']['movie'].runtimeType);

        MovieDataModel model = MovieDataModel.fromJson(data);
        print(model.movieData.id);
        return model.movieData;
      } else {
        throw Exception(response.body.toString());
      }
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}
