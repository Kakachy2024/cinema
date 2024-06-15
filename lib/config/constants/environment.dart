//aqui pueden ir las variables static que sean mas faciles de utilizar

import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  //copiamos nuestro configuracion
  static String movieDbKey = dotenv.env['MOVIEDB_KEY'] ?? 'Falta api key';
}
