import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

import '../../interfaces/interfaces.dart';

///
/// A classe [SmartCrashlyticsServicesImpl] implementa a interface [SmartCrashlyticsServices]
/// e fornece a implementação dos métodos definidos nessa interface.
/// Essa classe utiliza a biblioteca [firebase_crashlytics] para lidar com o envio de logs
/// e erros para o [Crashlytics] do Firebase.
///
/// - O método  log  registra uma mensagem no Crashlytics.
///
/// - O método  recordError  registra um erro no Crashlytics.
///
/// - O método  setCustomKey  define uma chave personalizada e seu valor no Crashlytics.
///
/// - O método  recordFlutterError  registra um erro do Flutter no Crashlytics.
///
/// - O método  recordFlutterFatalError  registra um erro fatal do Flutter no Crashlytics.
///
/// - O método  setCrashlyticsCollectionEnabled  habilita ou desabilita a coleta de dados pelo Crashlytics.
///
/// - O método  setUserIdentifier  define um identificador de usuário no Crashlytics.
///
/// Essa implementação utiliza a instância do [FirebaseCrashlytics] fornecida no construtor para
/// chamar os métodos correspondentes.
///
class SmartCrashlyticsServicesImpl implements SmartCrashlyticsServices {
  final FirebaseCrashlytics _instance;

  SmartCrashlyticsServicesImpl(this._instance);

  ///
  /// O método log registra uma mensagem no Crashlytics.
  ///
  @override
  Future<void> log(String message) async {
    await _instance.log(message);
  }

  ///
  /// O método recordError registra um erro no Crashlytics.
  ///
  @override
  Future<void> recordError(exception, stack) async {
    await _instance.recordError(exception, stack);
  }

  ///
  /// O método setCustomKey define uma chave personalizada e seu valor no Crashlytics.
  ///
  @override
  Future<void> setCustomKey(String key, String value) async {
    await _instance.setCustomKey(key, value);
  }

  ///
  /// O método recordFlutterError registra um erro do Flutter no Crashlytics.
  ///
  @override
  Future<void> recordFlutterError(FlutterErrorDetails flutterErrorDetails,
      {bool fatal = false}) async {
    await _instance.recordFlutterError(flutterErrorDetails, fatal: fatal);
  }

  ///
  /// O método recordFlutterFatalError registra um erro fatal do Flutter no Crashlytics.
  ///
  @override
  Future<void> recordFlutterFatalError(
      FlutterErrorDetails flutterErrorDetails) async {
    await _instance.recordFlutterFatalError(
      flutterErrorDetails,
    );
  }

  ///
  /// O método setCrashlyticsCollectionEnabled habilita ou desabilita a coleta de dados pelo Crashlytics.
  ///
  @override
  Future<void> setCrashlyticsCollectionEnabled(bool enabled) async {
    await _instance.setCrashlyticsCollectionEnabled(enabled);
  }

  ///
  /// O método setUserIdentifier define um identificador de usuário no Crashlytics.
  ///
  @override
  Future<void> setUserIdentifier(String identifier) async {
    await _instance.setUserIdentifier(identifier);
  }
}
