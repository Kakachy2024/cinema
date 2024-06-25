// ignore: unused_import
import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:cinemapedia/presentation/screens/movies/movies_slideshow_provider.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';

  const HomeScreen({super.key});
//mostrando el body
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
      //mostrando la barra de abajo
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();
    //llamar a la funcion para leer las paginas del notifier
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    //comentando variable para utilizar una clase especifica
    final slideShowMovies = ref.watch(moviesSlidesShowProvider);
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);

    /* return ListView.builder(
      itemCount: nowPlayingMovies.length,
      itemBuilder: (context, index) {
        final movie = nowPlayingMovies[index];
        return ListTile(
          title: Text(movie.title),
        );
      },
    ); */
    return Column(
      children: [
        //creamos nuestro custom appbar
        const CustomAppbar(),
        //hacer que ocupe el ancho maximo con el expanded
        /* Expanded(
          child: ListView.builder(
            itemCount: nowPlayingMovies.length,
            itemBuilder: (context, index) {
              final movie = nowPlayingMovies[index];
              return ListTile(
                title: Text(movie.title),
              );
            },
          ),
        ) */
        MoviesSlideshow(movies: slideShowMovies),
        MovieHorizontalListView(
          movies: nowPlayingMovies,
          titlelabel: 'En Cines',
          subtitlelabel: 'Lunes',
        )
      ],
    );
  }
}
