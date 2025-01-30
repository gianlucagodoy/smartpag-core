import '../../../utils/dependencies/dependecies.dart';

///
/// A classe [ZukLoggerServices] é uma classe abstrata que define os métodos para registrar logs
/// em diferentes tipos.
///
/// O método [log] é responsável por registrar um log com uma mensagem e um tipo de log específico.
/// O parâmetro [message] é a mensagem a ser registrada, enquanto o parâmetro [type]
/// especifica o tipo de log, que é do tipo [ZukLogType].
///
/// Os métodos [info], [debug], [warning] e [error] são métodos auxiliares que chamam o método [log]
/// com os tipos de log correspondentes.
///
/// O método [info] registra um log de informação,
///
/// o método [debug] registra um log de depuração,
///
/// o método [warning] registra um log de aviso
///
/// e o método [error] registra um log de erro.
///
/// O método [error] também aceita parâmetros opcionais, como [error]
/// (que pode conter informações adicionais sobre o erro),[dateTime]
/// (que especifica a data e hora em que o erro ocorreu) e [stackTrace]
/// (que contém a pilha de chamadas do erro).
///
/// Essa classe é uma abstração genérica para serviços de registro de logs e deve ser implementada
/// por classes concretas que fornecem a funcionalidade real de registro de logs.
///
abstract class ZukLoggerServices {
  /// O método [log] é responsável por registrar um log com uma mensagem e um tipo de log específico.
  /// O parâmetro [message] é a mensagem a ser registrada, enquanto o parâmetro [type]
  /// especifica o tipo de log, que é do tipo [ZukLogType].
  void log(
    String message, {
    required ZukLogType type,
  });

  ///
  /// registra um log de informação.
  ///
  void info(String message);

  ///
  /// registra um log de depuração.
  ///
  void debug(String message);

  ///
  /// registra um log de aviso.
  ///
  void warning(String message);

  ///
  /// registra um log de erro.
  ///
  /// O método [error] também aceita parâmetros opcionais, como [error]
  /// (que pode conter informações adicionais sobre o erro),[dateTime]
  /// (que especifica a data e hora em que o erro ocorreu) e [stackTrace]
  /// (que contém a pilha de chamadas do erro).
  ///
  void error(
    String message, [
    dynamic error,
    DateTime? dateTime,
    StackTrace? stackTrace,
  ]);
}
