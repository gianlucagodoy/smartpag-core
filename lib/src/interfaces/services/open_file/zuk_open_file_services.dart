///
/// Classe abstrata que define os serviços de abertura de arquivo do Zuk.
///
abstract class ZukOpenFileServices {
  ///
  /// Abre o arquivo especificado pelo caminho fornecido.
  ///
  /// @param filePath O caminho do arquivo a ser aberto.
  ///
  /// @return Um Future que indica se o arquivo foi aberto com sucesso ou não.
  ///
  Future<bool> openFile(String? filePath);
}
