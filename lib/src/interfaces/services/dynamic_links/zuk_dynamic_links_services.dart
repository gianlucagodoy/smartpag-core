///
/// Classe abstrata que define os serviços de links dinâmicos do Zuk.
///
abstract class ZukDynamicLinksServices {
  ///
  /// Inicializa os links dinâmicos do Zuk.
  ///
  /// @return Um Future que indica se a inicialização foi concluída com sucesso ou não
  ///
  Future<void> initDynamicLinks();
}
