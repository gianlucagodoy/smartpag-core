/// A classe abstrata de interface [ZukException] é uma classe base para exceções
/// personalizadas no contexto do projeto Zuk. Ela implementa a interface [Exception]
/// e possui um construtor que recebe o nome da classe e uma mensagem opcional como parâmetros.
/// A classe também possui as propriedades [message] e [className], que armazenam a mensagem e o nome da classe,
/// respectivamente.
///
/// O método "toString()" é sobrescrito para retornar uma representação em string da exceção.
/// Ele verifica se a propriedade [message] é uma string e, caso seja,
/// retorna a combinação do nome da classe e da mensagem. Caso contrário, retorna apenas o nome da classe.
abstract interface class ZukException implements Exception {
  const ZukException(
    this.className, [
    this.message,
  ]);

  /// Propriedade responsavel pelas mensagem de exceções para ser utilizado no metodo ".toString()"
  final String? message;

  /// Propriedade responsavel pelo nome da classe de exceções para ser utilizado no metodo ".toString()"
  final String className;

  /// O método "toString()" é sobrescrito para retornar uma representação em string da exceção.
  /// Ele verifica se a propriedade [message] é uma string e, caso seja,
  /// retorna a combinação do nome da classe e da mensagem. Caso contrário, retorna apenas o nome da classe.
  @override
  String toString() {
    if (message is String) return '$className: $message';
    return className;
  }
}
