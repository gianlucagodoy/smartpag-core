import 'package:shared_preferences/shared_preferences.dart';

import '../../../app_lib_core.dart';

///
/// A classe [PrefsServiceImpl] é uma implementação da interface [PrefsService] que lida com o
/// armazenamento e recuperação de preferências do usuário usando a classe [SharedPreferences].
///
/// Ela possui um construtor que recebe uma instância de [SharedPreferences] e a armazena em uma
/// variável privada [_sharedPreferences].
///
/// Os métodos implementados na classe permitem obter valores booleanos,
/// inteiros e strings armazenados nas preferências, bem como definir novos valores para esses
/// tipos de dados. Além disso, há um método para remover uma chave específica das preferências.
///
/// Essa implementação é útil para lidar com a persistência de dados simples em um aplicativo,
/// como configurações do usuário ou informações de estado.
///
class PrefsServiceImpl implements PrefsService {
  late final SharedPreferences _sharedPreferences;
  PrefsServiceImpl();

  ///
  /// @param key : indetificador unico para obter o valor bool?
  ///
  /// @return bool? : retorna um valor armazenado se existir  caso o contrario o valor será null
  ///
  @override
  bool? getBool({
    required String key,
  }) {
    return _sharedPreferences.getBool(key);
  }

  ///
  /// @param key : indetificador unico para obter o valor int?
  ///
  /// @return int? : retorna um valor armazenado se existir caso o contrario o valor será null
  ///
  @override
  int? getInt({
    required String key,
  }) {
    return _sharedPreferences.getInt(key);
  }

  ///
  /// @param key : indetificador unico para obter o valor String?
  ///
  /// @return String? : retorna um valor armazenado se existir caso o contrario o valor será null
  ///
  @override
  String? getString({
    required String key,
  }) {
    return _sharedPreferences.getString(key);
  }

  ///
  /// @param key : indetificador unico para salvar o valor bool
  ///
  /// @param value : valor utilizado para salvar nas preferencias compartilhadas.
  ///
  /// @return void : salva o valor bool nas preferencias compartilhadas usando o indentificador unico
  ///
  @override
  Future<void> setBool(
    String key, {
    required bool value,
  }) async {
    await _sharedPreferences.setBool(key, value);
  }

  ///
  /// @param key : indetificador unico para salvar o valor int
  ///
  /// @param value : valor utilizado para salvar nas preferencias compartilhadas.
  ///
  /// @return void : salva o valor int nas preferencias compartilhadas usando o indentificador unico
  ///
  @override
  Future<void> setInt(
    String key, {
    required int value,
  }) async {
    await _sharedPreferences.setInt(key, value);
  }

  ///
  /// @param key : indetificador unico para salvar o valor String
  ///
  /// @param value : valor utilizado para salvar nas preferencias compartilhadas.
  ///
  /// @return void : salva o valor String nas preferencias compartilhadas usando o indentificador unico
  ///
  @override
  Future<void> setString(
    String key, {
    required String value,
  }) async {
    await _sharedPreferences.setString(key, value);
  }

  ///
  /// Remove a chave e seu conteudo das preferencias compartilhadas.
  ///
  @override
  Future<void> removeKey({required String key}) async {
    await _sharedPreferences.remove(key);
  }

  @override
  Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  @override
  double? getDouble({required String key}) {
    return _sharedPreferences.getDouble(key);
  }

  @override
  Future<void> setDouble(String key, {required double value}) async {
    await _sharedPreferences.setDouble(key, value);
  }
}
