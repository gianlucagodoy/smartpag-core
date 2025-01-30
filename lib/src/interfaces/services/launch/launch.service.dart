///
/// A classe abstrata [LaunchService] define métodos para lançar diferentes tipos de serviços,
/// como enviar um e-mail, fazer uma ligação telefônica, enviar uma mensagem de texto ou abrir um arquivo.
/// Os métodos são assíncronos, o que significa que eles não bloqueiam a execução do código enquanto aguardam
/// a conclusão da operação.
///
/// - O método launchEmail envia um e-mail para o endereço especificado, com um assunto e corpo opcionais.
///
/// - O método launchPhoneCall realiza uma chamada telefônica para o número especificado.
///
/// - O método launchPhoneSms envia uma mensagem de texto para o número especificado.
///
/// - O método launchFile abre o arquivo especificado.
///
/// Esses métodos são abstratos, o que significa que eles não têm uma implementação concreta na classe abstrata.
/// Em vez disso, eles devem ser implementados por classes concretas que herdam da classe [LaunchService].
/// Isso permite que diferentes implementações desses serviços sejam criadas,
/// dependendo das necessidades específicas da aplicação.
///
abstract class LaunchService {
  ///
  /// envia um e-mail para o endereço especificado, com um assunto e corpo opcionais
  ///
  Future<void> launchEmail(String email, {String? subject, String? body});

  ///
  /// realiza uma chamada telefônica para o número especificado.
  ///
  Future<void> launchPhoneCall(String number);

  ///
  /// envia uma mensagem de texto para o número especificado.
  ///
  Future<void> launchPhoneSms(String number);

  ///
  /// abre o arquivo especificado.
  ///
  Future<void> launchFile(String filePath);

  ///
  /// abre o arquivo especificado.
  ///
  Future<void> launchLink(String link);
}
