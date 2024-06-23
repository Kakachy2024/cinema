import 'package:animate_do/animate_do.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:cinemapedia/domain/entities/movies.dart';
import 'package:flutter/material.dart';

class MoviesSlideshow extends StatelessWidget {
  //necesitamos el listado
  final List<Movie> movies;

  //constructor
  const MoviesSlideshow(
      {super.key,
      //siempre hay que anadir el required
      required this.movies});

  @override
  Widget build(BuildContext context) {
    //creando el slice de imagenes
    return SizedBox(
      height: 212,
      width: double.infinity,
      child: Swiper(
          viewportFraction: 0.8,
          scale: 0.9,
          autoplay: true,
          itemCount: movies.length,
          itemBuilder: (context, index) {
            //que vamos a mostrar
            final movie = movies[index];
            //returnar el widget creado
            return _Slide(
              movie: movie,
            );
            //tambien se puede usar esto en vez del paso anterior
            //*itemBuilder:(context, index)=> _Slide(movie:movies[index]),
          }),
    );
  }
}

//creando el widget de renderizado
class _Slide extends StatelessWidget {
  final Movie movie;

  const _Slide({required this.movie});

  @override
  Widget build(BuildContext context) {
    //creando diseno a la transicion
    final decoration = BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
              color: Colors.black45, blurRadius: 10, offset: Offset(0, 10))
        ]);

    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: DecoratedBox(
          decoration: decoration,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                movie.backdropPath,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress != null) {
                    return const DecoratedBox(
                        decoration: BoxDecoration(color: Colors.black12));
                  }
                  //creando una animacion con animate_do
                  return FadeIn(child: child);
                },
              ))),
    );
  }
}
