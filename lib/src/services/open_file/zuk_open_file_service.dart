import 'package:open_filex/open_filex.dart';

import '../../interfaces/interfaces.dart';

///
/// Implementação da classe [ZukOpenFileServices].
///
class ZukOpenFileServicesImpl implements ZukOpenFileServices {
  ///
  /// Abre um arquivo.
  ///
  /// @param [filePath] o caminho do arquivo a ser aberto.
  /// @return true se o arquivo foi aberto com sucesso, false caso contrário.
  ///
  @override
  Future<bool> openFile(String? filePath) async {
    if (filePath == null || filePath.isEmpty) {
      return false;
    } else {
      await OpenFilex.open(filePath);
      return true;
    }
  }
}
