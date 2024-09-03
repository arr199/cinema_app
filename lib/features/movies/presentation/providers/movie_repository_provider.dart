import 'package:cinema_app/features/movies/data/datasources/movie_datasource_impl.dart';
import 'package:cinema_app/features/movies/data/repositories/movie_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl(movieDataSource: MovieDataSourceImpl());
});
