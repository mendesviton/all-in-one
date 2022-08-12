import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../../domain/entities/movie_entity.dart';
import '../../dtos/movide_dto.dart';
import '../get_all_trending_movies_datasource.dart';

class GetAllTrendingMoviesRemoteDatasourceImp
    implements GetAllTrendingMoviesDatasource {
  final Dio _dio;

  GetAllTrendingMoviesRemoteDatasourceImp(this._dio);

  @override
  Future<List<MovieEntity>> getAllTrendingMovies(String timeWindow) async {
    List<MovieEntity> movies = [];

    try {
      final response = await _dio.get(
          'https://api.themoviedb.org/3/trending/movie/$timeWindow',
          queryParameters: {'api_key': 'ebc2616c37c1fd19a12e898b906f0f43'});

      movies = List.from(response.data['results'].map((value) {
        return MovieDto.fromMap(value);
      }));
    } catch (e) {
      debugPrint(e.toString());
    }
    return movies;
  }
}
