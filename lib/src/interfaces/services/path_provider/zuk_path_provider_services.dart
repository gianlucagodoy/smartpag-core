import 'dart:io';

///
/// Classe abstrata que define a interface para um serviço que fornece caminhos de diretórios relacionados ao aplicativo.
///
/// Essa classe é abstrata, o que significa que não pode ser instanciada diretamente, mas deve ser estendida
/// por uma classe concreta que implementa os métodos abstratos.
///
abstract class ZukPathProviderService {
  ///
  /// Retorna um diretório que é específico para o aplicativo, onde os arquivos relacionados ao aplicativo
  /// podem ser armazenados.
  ///
  /// @return Um objeto Directory que representa o diretório do aplicativo.
  ///
  Future<Directory> getAppDirectory();

  /// Retorna um diretório onde os documentos relacionados ao aplicativo podem ser armazenados.
  ///
  /// Este diretório é geralmente acessível para o usuário e pode ser usado para armazenar
  /// arquivos que devem ser compartilhados ou visualizados pelo usuário.
  ///
  /// @return Um objeto Directory que representa o diretório de documentos do aplicativo.
  ///
  Future<Directory> getAppDocumentsDirectory();

  Future<Directory?> getExternalStorageDirectory();
}
