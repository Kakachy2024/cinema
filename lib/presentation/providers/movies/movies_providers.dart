import 'package:cinemapedia/domain/entities/movies.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_repository_provider_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Que peliculas estan ahora, el statenotifier nos entrega si existe algun cambio
final nowPlayingMoviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final fetchMoreMovies = ref.watch(moviesRepositoryProvider).getNowPlaying;

  return MoviesNotifier(fetchMoreMovies: fetchMoreMovies);
});

//!definiendo el caso de uso
typedef MovieCallback = Future<List<Movie>> Function({int page});

// Implementar clase para saber que estado es el que queremos saber de nuestro notifier(peliculas)
class MoviesNotifier extends StateNotifier<List<Movie>> {
  //saber la pagina actual
  int currentPage = 0;
  MovieCallback fetchMoreMovies;

  MoviesNotifier({
    required this.fetchMoreMovies,
  }) : super([]);

  //implemetar el metodo para traer info que es definido por typedef
  Future<void> loadNextPage() async {
    currentPage++;
    final List<Movie> movies = await fetchMoreMovies(page: currentPage);
    state = [...state, ...movies];
  }
}
