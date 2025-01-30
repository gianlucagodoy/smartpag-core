import 'dart:io';

import 'dart:typed_data';

import '../../interfaces/interfaces.dart';

///
/// A classe [ZukFileServicesImpl] implementa a interface [ZukFileServices] e fornece métodos
/// para lidar com arquivos. Os métodos implementados são os seguintes:
///
/// 1. openWriteClose : Este método recebe um objeto [File] e uma lista de bytes [Uint8List]
/// como parâmetros. Ele abre o arquivo no modo de escrita, escreve o conteúdo fornecido no arquivo e,
/// em seguida, fecha o arquivo. Retorna  true  se a operação for bem-sucedida e false caso contrário.
///
/// 2. writeFile : Este método recebe um objeto [File], uma lista de inteiros [bytes] e um parâmetro
/// opcional [flush]. Ele escreve os [bytes] fornecidos no arquivo e retorna o objeto [File] atualizado.
/// O parâmetro [flush] indica se o conteúdo deve ser imediatamente gravado no disco ou não.
///
/// Esses métodos podem ser usados para manipular arquivos,
/// como escrever conteúdo em um arquivo ou atualizar o conteúdo de um arquivo existente.
///
class ZukFileServicesImpl implements ZukFileServices {
  ///
  /// Este método recebe um objeto [File] e uma lista de bytes [Uint8List]
  /// como parâmetros. Ele abre o arquivo no modo de escrita, escreve o conteúdo fornecido no arquivo e,
  /// em seguida, fecha o arquivo. Retorna  true  se a operação for bem-sucedida e false caso contrário.
  ///
  @override
  Future<bool> openWriteClose(File file, Uint8List content) async {
    try {
      final RandomAccessFile raf = file.openSync(mode: FileMode.write);
      await raf.writeFrom(content);
      await raf.close();
      return true;
    } catch (e) {
      return false;
    }
  }

  ///
  /// Este método recebe um objeto [File], uma lista de inteiros [bytes] e um parâmetro
  /// opcional [flush]. Ele escreve os [bytes] fornecidos no arquivo e retorna o objeto [File] atualizado.
  /// O parâmetro [flush] indica se o conteúdo deve ser imediatamente gravado no disco ou não.
  ///
  @override
  Future<File> writeFile(File file, List<int> bytes,
      {bool flush = false}) async {
    return file.writeAsBytes(bytes, flush: flush);
  }
}
