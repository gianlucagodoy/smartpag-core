///
/// A classe [GlobalDateFormatter]contém métodos estáticos para formatação e manipulação de datas.
///
/// O método nowMinusDays(int daysToSubtract) retorna a data atual subtraída do número de dias
/// especificado.
///
/// O método dateAtZeroTime(DateTime dateTime) retorna a data fornecida com a hora,
/// minuto e segundo definidos como zero.
///
/// O método dateAtEndTime(DateTime dateTime) retorna a data fornecida com a hora,
/// minuto e segundo definidos como 23:59:59.
///
/// O método isSameDay(DateTime date0, DateTime date1) verifica se duas datas são iguais,
/// comparando o dia, mês e ano. Retorna true se forem iguais e false caso contrário.
///
/// O método dateToString(DateTime dateTime) converte a data fornecida em uma string no formato
/// ISO 8601, removendo os milissegundos.
///
class GlobalDateFormatter {
  ///
  /// O método nowMinusDays(int daysToSubtract) retorna a data atual subtraída do número de dias
  /// especificado.
  ///
  static DateTime nowMinusDays(int daysToSubtract) {
    DateTime now = DateTime.now();
    return dateAtZeroTime(now.subtract(Duration(days: daysToSubtract)));
  }

  ///
  /// O método dateAtZeroTime(DateTime dateTime) retorna a data fornecida com a hora,
  /// minuto e segundo definidos como zero.
  ///
  static DateTime dateAtZeroTime(DateTime dateTime) {
    return DateTime(dateTime.year, dateTime.month, dateTime.day, 0, 0, 0);
  }

  ///
  /// O método dateAtEndTime(DateTime dateTime) retorna a data fornecida com a hora,
  /// minuto e segundo definidos como 23:59:59.
  ///
  static DateTime dateAtEndTime(DateTime dateTime) {
    return DateTime(dateTime.year, dateTime.month, dateTime.day, 23, 59, 59);
  }

  ///
  /// O método isSameDay(DateTime date0, DateTime date1) verifica se duas datas são iguais,
  /// comparando o dia, mês e ano. Retorna true se forem iguais e false caso contrário.
  ///
  static bool isSameDay(DateTime date0, DateTime date1) {
    if (date0.day == date1.day && date0.month == date1.month && date0.year == date1.year) return true;
    return false;
  }

  ///
  /// O método dateToString(DateTime dateTime) converte a data fornecida em uma string no formato
  /// ISO 8601, removendo os milissegundos.
  ///
  static String dateToString(DateTime dateTime) {
    return dateTime.toIso8601String().split('.')[0];
  }
}
