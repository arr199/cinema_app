import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String theMovieDBApiKey = dotenv.env["THE_MOVIE_DB_API_KEY"] ?? '';
}
