import 'package:cinemapedia/config/router/app_router.dart';
import 'package:cinemapedia/config/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Este es el archivo principal de la aplicacion.
  @override
  Widget build(BuildContext context) {
    //ocupamos el router creado
    return MaterialApp.router(
      //nos pide la configuracion del router
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      //agregando nuestro the al main
      theme: AppTheme().getTheme(),
    );
  }
}
