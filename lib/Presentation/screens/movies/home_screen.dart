// ignore: unused_import
import 'package:cinemapedia/config/constants/environment.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  //creando la ruta
  static const name = "home-scrren";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //mostrando en pantalla
    return const Scaffold(
        //body: Center(
        //child: Text("Hola desde homescreen"),
        //child: Text(Environment.movieDbKey),
        //),
        body: Placeholder());
  }
}
