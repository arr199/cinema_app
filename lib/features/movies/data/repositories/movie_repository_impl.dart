import 'package:cinema_app/features/movies/data/datasources/movie_datasource_impl.dart';
import 'package:cinema_app/features/movies/domain/entities/movie_entity.dart';
import 'package:cinema_app/features/movies/domain/repositories/movie_repository.dart';
import 'package:flutter/material.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieDataSourceImpl _movieDataSource;

  MovieRepositoryImpl({
    required MovieDataSourceImpl movieDataSource,
  }) : _movieDataSource = movieDataSource;

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    try {
      final movies = await _movieDataSource.getPlayingNow(page: page);
      return movies;
    } catch (err) {
      debugPrint("MovieRepositoryImpl ERROR $err");
      throw Exception(err);
    }
  }
}
