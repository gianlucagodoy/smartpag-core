import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

import '../../interfaces/interfaces.dart';
import '../../utils/utils.dart';

///
/// A classe [ZukLoggerServicesImpl] implementa a interface [ZukLoggerServices] e fornece
/// serviços de logging para a biblioteca Zuk.
///
/// O método [init] é responsável por inicializar o logger com o nível de log definido pela
/// variável de ambiente [DEFINE_LOG_LEVEL]. Se não houver uma definição,
/// o nível padrão será [INFO].
///
/// O método [log] recebe uma mensagem e um tipo de log e chama o método apropriado de logging com base no tipo fornecido.
///
/// Os métodos [info] , [debug] , [warning] e [error] são responsáveis por realizar o
/// logging com o nível apropriado. Eles verificam se o aplicativo está em modo de
/// depuração ( kDebugMode ) antes de realizar o logging.
///
/// O método [error] também pode receber um erro, uma data e um stack trace opcionais.
///
/// O método [_getLogLevel] converte uma string de nível de log em um objeto
/// [Level] do pacote [logger].
/// Os níveis de log possíveis são [INFO] , [DEBUG] , [WARNING]  e [ERROR] .
///
/// [ZukLoggerServicesImpl] é responsável por todo o **log** da aplicação.
///
/// O **logging** é feito apenas no modo **DEBUG**.
///
/// O [level] do logger pode ser definido com a variável [DEFINE_LOG_LEVEL].
///
/// ex **--dart-define DEFINE_LOG_LEVEL=[INFO, DEBUG, WARNING ou ERROR]**
///

class ZukLoggerServicesImpl implements ZukLoggerServices {
  late Logger logger;

  ///
  /// O método [init] é responsável por inicializar o logger com o nível de log definido pela
  /// variável de ambiente [DEFINE_LOG_LEVEL]. Se não houver uma definição,
  /// o nível padrão será [INFO].
  ///
  void init() {
    const level =
        String.fromEnvironment('DEFINE_LOG_LEVEL', defaultValue: 'INFO');
    logger = Logger(
      level: _getLogLevel(level),
    );
  }

  ///
  /// O método [log] recebe uma mensagem e um tipo de log e chama o método apropriado de
  /// logging com base no tipo fornecido.
  ///
  @override
  void log(
    String message, {
    required ZukLogType type,
  }) {
    if (type == ZukLogType.info) {
      info(message);
    } else if (type == ZukLogType.debug) {
      debug(message);
    } else if (type == ZukLogType.warning) {
      warning(message);
    } else if (type == ZukLogType.error) {
      error(message);
    }
  }

  ///
  /// Os métodos [info] , [debug] , [warning] e [error] são responsáveis por realizar o
  /// logging com o nível apropriado. Eles verificam se o aplicativo está em modo de
  /// depuração ( kDebugMode ) antes de realizar o logging.
  ///
  @override
  void info(String message) {
    if (kDebugMode) {
      logger.i(message);
    }
  }

  ///
  /// Os métodos [info] , [debug] , [warning] e [error] são responsáveis por realizar o
  /// logging com o nível apropriado. Eles verificam se o aplicativo está em modo de
  /// depuração ( kDebugMode ) antes de realizar o logging.
  ///
  @override
  void debug(String message) {
    if (kDebugMode) {
      logger.d(message);
    }
  }

  ///
  /// Os métodos [info] , [debug] , [warning] e [error] são responsáveis por realizar o
  /// logging com o nível apropriado. Eles verificam se o aplicativo está em modo de
  /// depuração ( kDebugMode ) antes de realizar o logging.
  ///
  @override
  void warning(String message) {
    if (kDebugMode) {
      logger.w(message);
    }
  }

  ///
  /// O método [error] também pode receber um erro, uma data e um stack trace opcionais.
  ///
  @override
  void error(
    String message, [
    dynamic error,
    DateTime? dateTime,
    StackTrace? stackTrace,
  ]) {
    if (kDebugMode) {
      logger.e(message, time: dateTime, error: error, stackTrace: stackTrace);
    }
  }

  ///
  /// O método [_getLogLevel] converte uma string de nível de log em um objeto
  /// [Level] do pacote [logger].
  /// Os níveis de log possíveis são [INFO] , [DEBUG] , [WARNING]  e [ERROR] .
  ///
  Level? _getLogLevel(String logLevel) {
    switch (logLevel) {
      case 'INFO':
        return Level.info;
      case 'DEBUG':
        return Level.debug;
      case 'WARNING':
        return Level.warning;
      case 'ERROR':
        return Level.error;
      default:
        return Level.info;
    }
  }
}
