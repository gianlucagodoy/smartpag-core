///
/// Classe abstrata que define os serviços de links dinâmicos do Smart.
///
abstract class SmartDynamicLinksServices {
  ///
  /// Inicializa os links dinâmicos do Smart.
  ///
  /// @return Um Future que indica se a inicialização foi concluída com sucesso ou não
  ///
  Future<void> initDynamicLinks();
}
