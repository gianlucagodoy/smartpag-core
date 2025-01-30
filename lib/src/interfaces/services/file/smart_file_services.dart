import 'dart:io';
import 'dart:typed_data';

///
/// Classe abstrata que define os serviços de manipulação de arquivos do tipo Smart.
///
/// Os métodos desta classe permitem escrever e fechar um arquivo, bem como abrir,
/// escrever e fechar um arquivo com conteúdo do tipo Uint8List.
///
abstract class SmartFileServices {
  ///
  /// Escreve os bytes fornecidos em um arquivo.
  ///
  /// @param file O arquivo onde os bytes serão escritos.
  ///
  /// @param bytes Os bytes a serem escritos.
  ///
  /// @param flush Um indicador opcional para indicar se o arquivo deve ser atualizado
  /// imediatamente após a escrita. O padrão é false.
  ///
  /// @return Um objeto File que representa o arquivo atualizado.
  Future<File> writeFile(File file, List<int> bytes, {bool flush = false});

  ///
  /// Abre, escreve e fecha um arquivo com o conteúdo fornecido como Uint8List.
  ///
  /// @param file O arquivo a ser aberto, escrito e fechado.
  ///
  /// @param content O conteúdo a ser escrito no arquivo.
  ///
  /// @return Um valor booleano indicando se a operação foi bem-sucedida ou não.
  ///
  Future<bool> openWriteClose(File file, Uint8List content);
}
