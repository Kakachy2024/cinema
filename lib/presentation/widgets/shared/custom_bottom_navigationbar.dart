import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        //quitamos la elevacion de la barra con esto
        elevation: 0,
        //este widget nos pide dos hijos
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_max), label: 'Inicio'),
          BottomNavigationBarItem(
              icon: Icon(Icons.label_outline), label: 'Categorias'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline), label: 'Favoritos'),
        ]);
  }
}
