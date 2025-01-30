import 'package:smartpag_domain/entities/entities.dart';

import '../../../app_lib_core.dart';
import '../dependencies/dependecies.dart';

///
/// A classe [SmartTextFormatterHelper]  contém métodos utilitários para formatar diferentes tipos de dados, como moeda,
/// data, hora e documentos (CPF e CNPJ).
///
/// - O método  formatCurrency  formata um número em formato de moeda, adicionando o símbolo de real
///  (R$) e separadores de milhar e decimal.
///
/// - O método  currencyToDouble  converte uma string formatada como moeda para um valor numérico.
///
/// - O método  formatDateTime  formata um objeto  DateTime  em uma string no
///  formato "dd/MM/yyyy - HH:mm", representando a data e hora.
///
/// - O método  stringToDateTime  converte uma string no formato "dd/MM/yyyy" em um objeto  DateTime .
///
/// - O método  formatDateMonthYear  formata uma string com a data no formato
///  "ddMMyy" para o formato "dd/MM/yyyy", adicionando o século de acordo com o ano.
///
/// - O método  formatDDMMYYDatetime  formata uma data e hora representadas por duas
///  strings no formato "ddMMyy" e "HHmmss" em um objeto  DateTime .
///
/// - O método  formatDate  formata um objeto  DateTime  em uma string no formato "dd/MM/yyyy",
///  representando apenas a data.
///
/// - O método  formatDateWithPtMonth  formata um objeto  DateTime  em uma string
///  no formato "dd - MMM yy", representando a data com o mês abreviado em português.
///
/// - O método  formatTime formata um objeto [DateTime]
///   em uma string no formato "HH:mm", representando apenas a hora.
///
/// - O método  formateHourMinuteSecond  formata uma string no formato "HHmmss"
///   em uma string no formato "HH:mm".
///
/// - O método  formatAddress  formata um objeto  AddressEntity  em uma string no formato
///    "Lg. <nome da rua>, <número>\n<cidade> - <estado>".
///
/// - O método  formatDocumentNumber  formata uma string contendo um número de
///   documento (CPF ou CNPJ) de acordo com o seu comprimento. Se o comprimento
///   for menor ou igual a 11, o número é tratado como CPF e
///   é formatado no formato "XXX.XXX.XXX-XX". Caso contrário, o número é tratado como CNPJ e
///   é formatado no formato "XX.XXX.XXX/XXXX-XX".
///
class SmartTextFormatterHelper {
  static final NumberFormat currencyFormat =
      NumberFormat('R\$ #,##0.00', 'pt_BR');
  static final DateFormat dateTimeFormat = DateFormat('dd/MM/yyyy - HH:mm');
  static final DateFormat dateFormat = DateFormat('dd/MM/yyyy');
  static final DateFormat dateFormatWithPtMonth =
      DateFormat('dd - MMM yy', 'pt_BR');
  static final DateFormat timeFormat = DateFormat('HH:mm');

  ///
  /// - O método  formatCurrency  formata um número em formato de moeda, adicionando o símbolo de real
  ///  (R$) e separadores de milhar e decimal.
  ///
  static String formatCurrency(double input) {
    return currencyFormat.format(input);
  }

  ///
  /// - O método  currencyToDouble  converte uma string formatada como moeda para um valor numérico.
  ///
  static double currencyToDouble(String input) {
    return double.parse(input.replaceAll(RegExp(r'[^0-9]'), '')) / 100;
  }

  ///
  /// - O método  formatDateTime  formata um objeto  DateTime  em uma string no
  ///  formato "dd/MM/yyyy - HH:mm", representando a data e hora.
  ///
  static String formatDateTime(DateTime input) {
    return dateTimeFormat.format(input);
  }

  /// String for 12-03-2017 12h34m56s -> 12/03/2017 - 12:34
  static DateTime stringToDateTime(String input) {
    List<String> dateList = input.split('/');
    return DateTime.parse('${dateList[2]}-${dateList[1]}-${dateList[0]}');
  }

  /// 220320 -> 20/03/2022
  static String formatDateMonthYear(String input) {
    String month = input.substring(2, 4);
    String day = input.substring(4, 6);
    String year = input.substring(0, 2);
    if (int.parse(year) > DateTime.now().year) {
      return "$day/$month/19$year";
    }
    return "$day/$month/20$year";
  }

  /// 220320, 123456 -> 20-03-2022 12h34m56s
  static DateTime formatDDMMYYDatetime(String date, String time) {
    String year = date.substring(0, 2);
    int month = int.tryParse(date.substring(2, 4))!;
    int day = int.tryParse(date.substring(4, 6))!;

    int hour = int.tryParse(time.substring(0, 2))!;
    int minute = int.tryParse(time.substring(2, 4))!;
    int second = int.tryParse(time.substring(4, 6))!;

    if (int.tryParse(year)! > DateTime.now().year) {
      int yearInt = int.tryParse('19$year')!;

      return DateTime(yearInt, month, day, hour, minute, second);
    }
    int yearInt = int.tryParse('20$year')!;
    return DateTime(yearInt, month, day, hour, minute, second);
  }

  /// DateTime for  12-03-2017 12h34m56s -> 12/03/2017
  static String formatDate(DateTime input) {
    return dateFormat.format(input);
  }

  /// DateTime for  12-03-2017 12h34m56s -> 12 - Mar 17
  static String formatDateWithPtMonth(DateTime input) {
    return dateFormatWithPtMonth.format(input);
  }

  /// DateTime for 12-03-2017 12h34m56s -> 12:34
  static String formatTime(DateTime input) {
    return timeFormat.format(input);
  }

  /// 204503 -> 20:45
  static String formateHourMinuteSecond(String input) {
    String minute = input.substring(2, 4);
    String hour = input.substring(0, 2);

    return "$hour:$minute";
  }

  ///
  /// - O método  formatAddress  formata um objeto  AddressEntity  em uma string no formato
  ///    "Lg. <nome da rua>, <número>\n<cidade> - <estado>".
  ///
  static String formatAddress(AddressEntity address) {
    return 'Lg. ${address.streetName}, ${address.number}\n${address.city!.toUpperCase()} - ${address.state}';
  }

  /// Função utilzada para formatar a string 'input' em cpf ou cnpj
  /// a formatação vai depender do length do 'input'.
  /// CPF 12345678912 -> 123.456.789-12
  /// CNPJ 12345678912345 -> 12.345.678/9123-45
  ///{@tool snippet}
  ///
  /// ```dart
  ///  final String cpf = TextFormatter.formatDocumentNumber('12345678912');
  ///  final String cnpj = TextFormatter.formatDocumentNumber('12345678912345');
  ///  print(cpf);
  ///  print(cnpj);
  ///  output:
  ///  123.456.789-12
  ///  12.345.678/9123-45
  /// ```
  ///{@end-tool}
  ///
  /// - O método  formatDocumentNumber  formata uma string contendo um número de
  ///   documento (CPF ou CNPJ) de acordo com o seu comprimento. Se o comprimento
  ///   for menor ou igual a 11, o número é tratado como CPF e
  ///   é formatado no formato "XXX.XXX.XXX-XX". Caso contrário, o número é tratado como CNPJ e
  ///   é formatado no formato "XX.XXX.XXX/XXXX-XX".
  ///
  static String formatDocumentNumber(String input) {
    if (input.length <= 11) {
      return SmartMaskTextInputFormatters.cpfTextFormatter.maskText(input);
    } else {
      return SmartMaskTextInputFormatters.cnpjTextFormatter.maskText(input);
    }
  }
}
