import 'package:cinema_app/core/constants/environment.dart';
import 'package:cinema_app/features/movies/data/models/the_movie_db/now_playing_movies_model.dart';
import 'package:cinema_app/features/movies/domain/datasources/movie_datasource.dart';
import 'package:cinema_app/features/movies/domain/entities/movie_entity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class MovieDataSourceImpl implements MovieDataSource {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3',
    queryParameters: {
      'api_key': Environment.theMovieDBApiKey,
      'language': 'en-US'
    },
  ));

  @override
  Future<List<Movie>> getPlayingNow({int page = 1}) async {
    try {
      final response = await dio.get("/movie/now_playing");

      final NowPlayingMovies playingMoviesResponse =
          NowPlayingMovies.fromJson(response.data);

      List<Movie> movies =
          playingMoviesResponse.results.map((e) => e.toEntity()).toList();

      return movies;
    } catch (err) {
      debugPrint("getPlayingNow DATASOURCE IMPL ERROR $err");
      throw Exception(err);
    }
  }
}
