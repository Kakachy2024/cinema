import 'package:cinemapedia/domain/entities/movies.dart';

//aqui solicitamos lo que necesitamos
abstract class MoviesDatasource {
  Future<List<Movie>> getNowPlaying({int page = 1});
}
