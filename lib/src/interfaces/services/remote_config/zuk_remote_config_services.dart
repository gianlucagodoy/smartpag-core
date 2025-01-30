///
/// Classe abstrata para serviços de configuração remota do Zuk.
///
/// Essa classe define os métodos necessários para inicializar a configuração remota
///
/// e obter valores booleanos ou mapas de valores associados a chaves específicas.
///
abstract class ZukRemoteConfigServices {
  ///
  /// Inicializa a configuração remota.
  ///
  /// Esse método deve ser implementado pelas classes que herdam essa classe abstrata.
  ///
  /// Ele é responsável por realizar as configurações iniciais necessárias para a
  ///
  /// utilização da configuração remota.
  ///
  Future<void> initRemoteConfig(Map<String, dynamic> defaultParameters);

  ///
  /// Obtém um valor booleano associado a uma chave específica.
  ///
  /// @param key A chave do valor booleano desejado.
  ///
  /// @return Um Future<bool> que representa o valor booleano associado à chave.
  ///
  Future<bool> getBool(String key);

  ///
  /// Obtém um mapa de valores booleanos associados a uma chave específica.
  ///
  /// @param key A chave do mapa de valores desejado.
  ///
  /// @return Um Future<Map<int, bool>> que representa o mapa de valores associado à chave.
  ///
  Future<Map<int, bool>> getValue(String key);
}
