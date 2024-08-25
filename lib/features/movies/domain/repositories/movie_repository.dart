import 'package:cinema_app/features/movies/domain/entities/movie_entity.dart';

abstract class MovieRepository {
  Future<List<Movie>> getNowPlaying({int page = 1});
}

