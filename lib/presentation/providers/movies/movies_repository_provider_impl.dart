import 'package:cinemapedia/infrastructure/datasource/moviedb_datasource.dart';
import 'package:cinemapedia/infrastructure/repositories/movies_repostory_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//necesitamos un provider para creara la instancia y este debe ser de solo lectura ya que no se debe modificar

//creamos nuestro repositorio de la instancia es inmutable
//objetivo es proveer de informacion a todos los demas provider que necesiten de este repositorio
final moviesRepositoryProvider = Provider((ref) {
//* Lo que deseamos retornar:
  return MoviesRepostoryImpl(MoviedbDatasource());
});
