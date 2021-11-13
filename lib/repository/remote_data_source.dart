import 'dart:convert' as convert;

import 'package:flutter_demo_project/constants/configs.dart';
import 'package:flutter_demo_project/models/popular_movie.dart';
import 'package:http/http.dart' as http;

abstract class MovieDataSource {
  Future<List<PopularMovie>> getPopularMovies();
}

class RemoteDataSource implements MovieDataSource {
  static final Map<String, dynamic> _baseQueryParams = {
    'api_key': MovieDBService.apiKey
  };

  Uri _buildQueryUri(String path, Map<String, dynamic> queryParams) {
    return Uri.https(
        MovieDBService.baseUrl, path, _baseQueryParams..addAll(queryParams));
  }

  @override
  Future<List<PopularMovie>> getPopularMovies() async {
    var response = await http
        .get(_buildQueryUri(MovieDBService.popularMoviePath, {'page': "1"}));
    return PopularMovieResults.fromMap(
            convert.jsonDecode(response.body) as Map<String, dynamic>)
        .results;
  }
}
