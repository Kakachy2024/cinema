// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/config/helpers/human_formats.dart';
import 'package:flutter/material.dart';

import 'package:cinemapedia/domain/entities/movies.dart';

class MovieHorizontalListView extends StatelessWidget {
  //necesitamos las peliculas para mostrar y crear sus respectivas variables
  final List<Movie> movies;
  final String? titlelabel;
  final String? subtitlelabel;
  final VoidCallback? loadNextPage;

  const MovieHorizontalListView({
    super.key,
    required this.movies,
    this.titlelabel,
    this.subtitlelabel,
    this.loadNextPage,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 350,
        child: Column(
          children: [
            if (titlelabel != null || subtitlelabel != null)
              _Title(title: titlelabel, subTitle: subtitlelabel),

            // creando el listview de forma Horizontal
            Expanded(
                child: ListView.builder(
              itemCount: movies.length,
              //colocando el scroll en forma horizontal
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return _Slide(movie: movies[index]);
              },
            ))
          ],
        ));
  }
}

class _Slide extends StatelessWidget {
  final Movie movie;

  const _Slide({required this.movie});

  @override
  Widget build(BuildContext context) {
    //creando variable para styles de subtitulos
    final textStyles = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        // creamos un crossAxisAlignment para ordenar al inicio
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //* Propiedades de las imagenes
          SizedBox(
            width: 150,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                //para que las imagenes mantengan un mismo alto utilizar fit
                fit: BoxFit.cover,
                movie.posterPath,
                width: 150,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress != null) {
                    return const Center(
                        child: CircularProgressIndicator(strokeWidth: 2));
                  }

                  return FadeIn(child: child);
                },
              ),
            ),
          ),
          //creando una especie de spacio
          const SizedBox(height: 5),
          //* Prooiedades de los subtitulos peliculas
          SizedBox(
            width: 150,
            child: Text(
              movie.title,
              maxLines: 2,
              style: textStyles.titleSmall,
            ),
          ),

          //* Ranking de vistas

          Row(children: [
            Icon(Icons.star_half_outlined, color: Colors.yellow.shade800),
            const SizedBox(
                width:
                    3), //? colocando espacios entre la estrella y los numeros
            Text(
              '${movie.voteAverage}',
              style: textStyles.bodyMedium
                  ?.copyWith(color: Colors.yellow.shade800),
            ),
            const SizedBox(width: 30), //dando espacio entre icono y vistas
            //Text('${movie.popularity}',style: textStyles.bodySmall?.copyWith(color: Colors.black),
            Text(HumanFormats.number(movie.popularity),
                style: textStyles.bodySmall),
          ])
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final String? title;
  final String? subTitle;

  const _Title({this.title, this.subTitle});

  @override
  Widget build(BuildContext context) {
    // creando estilo al titulos
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    // colocando los subtitulos
    return Container(
        padding: const EdgeInsets.only(top: 10),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            //colocando condicion si la pelicula no esta
            if (title != null) Text(title!, style: titleStyle),
            //dar espacio
            const Spacer(),

            if (subTitle != null)
              FilledButton.tonal(
                style: const ButtonStyle(visualDensity: VisualDensity.compact),
                onPressed: () {},
                child: Text(subTitle!),
              )
          ],
        ));
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:cinemapedia/domain/entities/movies.dart';

class MovieHorizontalListView extends StatelessWidget {
  //necesitamos las peliculas para mostrar y crear sus respectivas variables
  final List<Movie> movies;
  final String? titlelabel;
  final String? subtitlelabel;
  final VoidCallback? loadNextPage;

  const MovieHorizontalListView({
    super.key,
    required this.movies,
    this.titlelabel,
    this.subtitlelabel,
    this.loadNextPage,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 350,
        child: Column(
          children: [
            if (titlelabel != null || subtitlelabel != null)
              _Title(title: titlelabel, subTitle: subtitlelabel),
          ],
        ));
  }
}

class _Title extends StatelessWidget {
  final String? title;
  final String? subTitle;

  const _Title({this.title, this.subTitle});

  @override
  Widget build(BuildContext context) {
    // creando estilo al titulos
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    // colocando los subtitulos
    return Container(
        padding: const EdgeInsets.only(top: 10),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            //colocando condicion si la pelicula no esta
            if (title != null) Text(title!, style: titleStyle),
            //dar espacio
            const Spacer(),

            if (subTitle != null)
              FilledButton.tonal(
                style: const ButtonStyle(visualDensity: VisualDensity.compact),
                onPressed: () {},
                child: Text(subTitle!),
              )
          ],
        ));
  }
}
