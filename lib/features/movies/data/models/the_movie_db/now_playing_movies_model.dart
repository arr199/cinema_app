import 'package:cinema_app/features/movies/data/models/the_movie_db/movie_model.dart';
import 'package:cinema_app/features/movies/data/models/the_movie_db/dates_model.dart';
import 'dart:convert';

NowPlayingMovies usersFromJson(String str) =>
    NowPlayingMovies.fromJson(json.decode(str));

String usersToJson(NowPlayingMovies data) => json.encode(data.toJson());

class NowPlayingMovies {
  final Dates? dates;
  final int page;
  final List<MovieModel> results;
  final int totalPages;
  final int totalResults;

  NowPlayingMovies({
    required this.dates,
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory NowPlayingMovies.fromJson(Map<String, dynamic> json) =>
      NowPlayingMovies(
        dates: json["dates"] != null ? Dates.fromJson(json["dates"]) : null,
        page: json["page"],
        results: List<MovieModel>.from(
            json["results"].map((x) => MovieModel.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  Map<String, dynamic> toJson() => {
        "dates": dates?.toJson(),
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
      };
}
