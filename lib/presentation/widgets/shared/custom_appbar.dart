import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    //creando colores personalizados para el icon
    final colors = Theme.of(context).colorScheme;
    //creando el thema
    final titleStyle = Theme.of(context).textTheme.titleMedium;
    //dado que hay espacios que pueden tener camara mejor utilizare SafeArea
    return SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              //dar el maximo del ancho
              width: double.infinity,
              child: Row(
                children: [
                  Icon(
                    Icons.movie_outlined,
                    color: colors.secondary,
                  ),
                  const SizedBox(width: 5),
                  Text('Cinemapedia', style: titleStyle),
                  //dar espacio al icono
                  const Spacer(),
                  //creando el boton de busqueda
                  IconButton(onPressed: () {}, icon: const Icon(Icons.search))
                ],
              ),
            )));
  }
}
