import 'dart:io';

import 'package:path_provider/path_provider.dart';

import '../../interfaces/interfaces.dart';

///
/// A classe [ZukPathProviderServiceImpl] implementa a interface [ZukPathProviderService].
/// Ela fornece métodos para obter os diretórios do aplicativo.
///
/// O método [getAppDirectory] retorna um objeto Future que representa o diretório
/// temporário do aplicativo. Esse diretório é usado para armazenar arquivos temporários
/// que podem ser excluídos a qualquer momento.
///
/// O método [getAppDocumentsDirectory] retorna um objeto Future que representa o diretório
/// de documentos do aplicativo. Esse diretório é usado para armazenar
/// arquivos que devem ser persistidos e acessíveis em várias execuções do aplicativo.
///
class ZukPathProviderServiceImpl implements ZukPathProviderService {
  ///
  /// O método [getAppDirectory] retorna um objeto Future que representa o diretório
  /// temporário do aplicativo. Esse diretório é usado para armazenar arquivos temporários
  /// que podem ser excluídos a qualquer momento.
  ///
  @override
  Future<Directory> getAppDirectory() {
    return getTemporaryDirectory();
  }

  ///
  /// O método [getAppDocumentsDirectory] retorna um objeto Future que representa o diretório
  /// de documentos do aplicativo. Esse diretório é usado para armazenar
  /// arquivos que devem ser persistidos e acessíveis em várias execuções do aplicativo.
  ///
  @override
  Future<Directory> getAppDocumentsDirectory() {
    return getApplicationDocumentsDirectory();
  }

  @override
  Future<Directory?> getExternalStorageDirectory() async {
    return getExternalStorageDirectory();
  }
}
