import 'package:cinema_app/features/movies/domain/entities/movie_entity.dart';

abstract class MovieDataSource {
  Future<List<Movie>> getPlayingNow({int page = 1});
}
