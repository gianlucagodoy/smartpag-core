///
/// Classe abstrata que representa um serviço de segurança.
///
/// Este serviço é responsável por obter e definir valores de segurança, identificados por chaves.
///
abstract class SecurityService {
  ///
  /// Obtem o Valor inserido no [SecurityServices] do tipo [String]
  ///
  /// @param key responsavel por localizar o valor do tipo [String] ou null caso não tenha o valor salvo.
  ///
  /// @return uma String ou null em caso de não existir o valor salvo.
  ///
  Future<String?> getValue(String key);

  ///
  /// seta o Valor inserido no [SecurityServices] do tipo [String]
  ///
  /// @param key responsavel por localizar o valor do tipo [String] ou null caso não tenha o valor salvo.
  ///
  /// @param value valor do tipo [String] ou null para ser salvo utilizando a [key] no [SecurityServices]
  ///
  /// @return uma [String] ou null em caso de não existir o valor salvo.
  ///
  Future<void> setValue(String key, String? value);
}
