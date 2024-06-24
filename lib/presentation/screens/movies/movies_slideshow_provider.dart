//creando un provider de solo lectura
import 'package:cinemapedia/domain/entities/movies.dart';
import 'package:cinemapedia/presentation/providers/movies/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final moviesSlidesShowProvider = Provider<List<Movie>>(
    //buscando el provider
    (ref) {
  final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
  // Creando condicion si esta vacio
  if (nowPlayingMovies.isEmpty) return [];
  // Creando operacion si la consicion no es la deseada
  return nowPlayingMovies.sublist(0, 6);
});
