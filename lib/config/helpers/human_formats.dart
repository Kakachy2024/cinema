import 'package:intl/intl.dart';

class HumanFormats {
  static String number(double number) {
    final formatNumber = NumberFormat.compactCurrency(
      //sin decimales
      decimalDigits: 0,
      //que no tenga simbolos
      symbol: '',
      //colocaremos en este caso locale 'en' por su abrebiacion de miles
      locale: 'en',
    ).format(number);

    return formatNumber;
  }
}
