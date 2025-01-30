import 'dart:convert';

import 'package:firebase_remote_config/firebase_remote_config.dart';

import '../../interfaces/interfaces.dart';

///
/// A classe [SmartRemoteConfigServicesImpl] implementa a interface [SmartRemoteConfigServices]
/// e é responsável por fornecer serviços relacionados à configuração remota do Firebase.
/// Ela possui um construtor que recebe uma instância de [FirebaseRemoteConfig] como parâmetro.
///
/// O método [getBool] é usado para obter um valor booleano da configuração remota.
/// Antes de retornar o valor desejado, o método realiza o fetch e ativação da configuração remota.
///
/// O método [getValue] é usado para obter um mapa de valores inteiros e booleanos da configuração
/// remota. Ele também realiza o fetch e ativação da configuração remota antes de retornar
/// o mapa de valores.
///
/// O método [initRemoteConfig] é usado para inicializar a configuração remota com os
/// parâmetros padrão fornecidos. Ele define as configurações do [FirebaseRemoteConfig]
/// e os valores padrão.
///
class SmartRemoteConfigServicesImpl implements SmartRemoteConfigServices {
  SmartRemoteConfigServicesImpl(this._firebaseRemoteConfig);
  final FirebaseRemoteConfig _firebaseRemoteConfig;

  ///
  /// O método [getBool] é usado para obter um valor booleano da configuração remota.
  /// Antes de retornar o valor desejado, o método realiza o fetch e ativação da configuração remota.
  ///
  @override
  Future<bool> getBool(String key) async {
    await _firebaseRemoteConfig.fetchAndActivate();
    return _firebaseRemoteConfig.getBool(key);
  }

  ///
  /// O método [getValue] é usado para obter um mapa de valores inteiros e booleanos da configuração
  /// remota. Ele também realiza o fetch e ativação da configuração remota antes de retornar
  /// o mapa de valores.
  ///
  @override
  Future<Map<int, bool>> getValue(String key) async {
    await _firebaseRemoteConfig.fetchAndActivate();
    final dynamic remoteConfigValue =
        json.decode(_firebaseRemoteConfig.getValue(key).asString());
    final Map<int, bool> benefitsEnabledMap = {};
    remoteConfigValue.forEach((key, value) {
      if (key != null && value != null) {
        benefitsEnabledMap[int.tryParse(key)!] = value == 'true';
      }
    });
    return benefitsEnabledMap;
  }

  ///
  /// O método [initRemoteConfig] é usado para inicializar a configuração remota com os
  /// parâmetros padrão fornecidos. Ele define as configurações do [FirebaseRemoteConfig]
  /// e os valores padrão.
  ///
  @override
  Future<void> initRemoteConfig(Map<String, dynamic> defaultParameters) async {
    await _firebaseRemoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 1),
        minimumFetchInterval: const Duration(seconds: 0)));
    await _firebaseRemoteConfig.setDefaults(defaultParameters
        //const {"granclube": false}
        );
  }
}
