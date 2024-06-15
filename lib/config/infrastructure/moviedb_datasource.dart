//la implementacion para el domain, este datasouce esta hecho solo para trabajar con moviedb
import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movies.dart';
import 'package:dio/dio.dart';

class MovidedbDatasource extends MoviesDatasource {
  //implementar lo que nos pide
  //configurando nuestro cliente http para moviedb
  final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.movieDbKey,
        'language': 'es-MX'
      }));

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get('/movie/now_playing');

    final List<Movie> movies = [];

    return movies;
  }
}
