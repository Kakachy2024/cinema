// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movies.dart';
import 'package:cinemapedia/domain/repositories/movies_repository_impl.dart';

//*LLamado al data Source
// Primero: creamos la clase y llamamos al el @override
class MoviesRepostoryImpl extends MoviesRepository {
  //Segundo: creamos la variable del llamando a la clase padre
  final MoviesDatasource datasource;

  //Tercero: creamos  el constructor
  MoviesRepostoryImpl(
    this.datasource,
  );

  //viene definida al crear la clase (esta es la implementacion)
  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    //retornamos la peticion
    return datasource.getNowPlaying(page: page);
  }
}
