import 'package:cinemapedia/domain/entities/movies.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/movie_moviedb.dart';

class MovieMapper {
  static Movie movieDbToEntity(MovieMovieDB moviedb) => Movie(
      adult: moviedb.adult,
      backdropPath: (moviedb.backdropPath != '')
          ? 'https://image.tmdb.org/t/p/w500${moviedb.backdropPath}'
          : 'https://www.shutterstock.com/shutterstock/photos/1321646582/display_1500/stock-vector-internet-error-message-page-not-found-with-a-broken-robot-cartoon-illustration-1321646582.jpg',
      genreIds: moviedb.genreIds
          .map((e) => e.toString())
          .toList(), //conversion de int a string
      id: moviedb.id,
      originalLanguage: moviedb.originalLanguage,
      originalTitle: moviedb.originalTitle,
      overview: moviedb.overview,
      popularity: moviedb.popularity,
      posterPath: (moviedb.posterPath != '')
          ? 'https://image.tmdb.org/t/p/w500${moviedb.backdropPath}'
          : 'https://www.shutterstock.com/shutterstock/photos/1321646582/display_1500/stock-vector-internet-error-message-page-not-found-with-a-broken-robot-cartoon-illustration-1321646582.jpg',
      releaseDate: moviedb.releaseDate,
      title: moviedb.title,
      video: moviedb.video,
      voteAverage: moviedb.voteAverage,
      voteCount: moviedb.voteCount);
}
