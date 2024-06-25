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
