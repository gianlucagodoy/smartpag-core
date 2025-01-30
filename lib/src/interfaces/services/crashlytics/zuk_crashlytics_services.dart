import 'package:flutter/foundation.dart';

/// Classe abstrata que define os serviços do Zuk Crashlytics.
abstract class ZukCrashlyticsServices {
  ///
  /// Registra uma mensagem no Crashlytics.
  ///
  /// @param message A mensagem a ser registrada.
  ///
  Future<void> log(String message);

  ///
  /// Registra um erro no Crashlytics.
  ///
  /// @param exception A exceção a ser registrada.
  /// @param stack O stack trace associado à exceção.
  ///
  Future<void> recordError(dynamic exception, StackTrace? stack);

  ///
  /// Define uma chave personalizada no Crashlytics.
  ///
  /// @param key A chave personalizada.
  /// @param value O valor associado à chave.
  ///
  Future<void> setCustomKey(String key, String value);

  ///
  /// Registra um erro do Flutter no Crashlytics.
  ///
  /// @param flutterErrorDetails Os detalhes do erro do Flutter.
  /// @param fatal Indica se o erro é fatal ou não (opcional, padrão é false).
  ///
  Future<void> recordFlutterError(FlutterErrorDetails flutterErrorDetails,
      {bool fatal = false});

  ///
  /// Registra um erro fatal do Flutter no Crashlytics.
  ///
  /// @param flutterErrorDetails Os detalhes do erro fatal do Flutter.
  ///
  Future<void> recordFlutterFatalError(FlutterErrorDetails flutterErrorDetails);

  ///
  /// Define o identificador do usuário no Crashlytics.
  ///
  /// @param identifier O identificador do usuário.
  ///
  Future<void> setUserIdentifier(String identifier);

  ///
  /// Define se a coleta de dados do Crashlytics está habilitada ou não.
  ///
  /// @param enabled Indica se a coleta de dados está habilitada.
  ///
  Future<void> setCrashlyticsCollectionEnabled(bool enabled);
}
