import 'package:flutter/material.dart';
import 'package:cinemapedia/config/router/app_router.dart';
import 'package:cinemapedia/config/theme/app_theme.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  //leer las variables de entorno del archivo .env
  await dotenv.load(fileName: ".env");
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
      //agregando nuestro theme al main
      theme: AppTheme().getTheme(),
      //no ingresamos nada mas
    );
  }
}
