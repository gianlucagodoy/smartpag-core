///
/// Classe abstrata que define um serviço de preferências.
///
/// Este serviço permite obter e definir valores booleanos, inteiros e strings
///
/// associados a chaves específicas.
///
abstract class PrefsService {
  Future<void> init();

  ///
  /// Obtém um valor booleano associado à chave especificada.
  ///
  /// @param key A chave associada ao valor booleano.
  ///
  /// @return O valor booleano associado à chave, ou null caso a chave não exista.
  ///
  bool? getBool({
    required String key,
  });

  ///
  /// Obtém um valor inteiro associado à chave especificada.
  ///
  /// @param key A chave associada ao valor inteiro.
  ///
  /// @return O valor inteiro associado à chave, ou null caso a chave não exista
  ///
  int? getInt({
    required String key,
  });

  double? getDouble({
    required String key,
  });

  ///
  /// Obtém uma string associada à chave especificada.
  ///
  /// @param key A chave associada à string.
  ///
  /// @return A string associada à chave, ou null caso a chave não exista.
  ///
  String? getString({
    required String key,
  });

  ///
  /// Define um valor booleano associado à chave especificada.
  ///
  /// @param key A chave associada ao valor booleano.
  ///
  /// @param value O valor booleano a ser definido.
  ///
  /// @return Uma future que é completada quando a operação é concluída.
  ///
  Future<void> setBool(
    String key, {
    required bool value,
  });

  ///
  /// Define um valor inteiro associado à chave especificada.
  ///
  /// @param key A chave associada ao valor inteiro.
  ///
  /// @param value O valor inteiro a ser definido.
  ///
  /// @return Uma future que é completada quando a operação é concluída.
  ///
  Future<void> setInt(
    String key, {
    required int value,
  });

  Future<void> setDouble(
    String key, {
    required double value,
  });

  ///
  /// Define uma string associada à chave especificada.
  ///
  /// @param key A chave associada à string.
  ///
  /// @param value A string a ser definida.
  ///
  /// @return Uma future que é completada quando a operação é concluída.
  ///
  Future<void> setString(
    String key, {
    required String value,
  });

  ///
  /// Remove a chave e o valor associados.
  ///
  /// @param key A chave a ser removida.
  ///
  /// @return Uma future que é completada quando a operação é concluída.
  ///
  Future<void> removeKey({
    required String key,
  });
}
