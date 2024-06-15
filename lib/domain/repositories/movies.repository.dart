import 'package:cinemapedia/domain/entities/movies.dart';

//los repositorios son los que llaman al datasource para la eleccion de la db
abstract class MovieRepository {
  Future<List<Movie>> getNowPlaying({int page = 1});
}
