import 'package:zukcore/src/interfaces/interfaces.dart';

/// A classe [HttpTimeOutException] é uma exceção específica para erros de tempo limite em requisições HTTP.
/// Ela herda da classe [HTTPZukException].
class HttpTimeOutException extends HTTPZukException {
  const HttpTimeOutException([String? messageException])
      : super('HttpTimeOutException', messageException);
}

/// A classe [HttpMethodNotAlloAllowedException] é uma exceção específica para erros de método HTTP não permitido.
/// Ela também herda da classe [HTTPZukException] .
class HttpMethodNotAlloAllowedException extends HTTPZukException {
  const HttpMethodNotAlloAllowedException([String? messageException])
      : super('HttpMethodNotAlloAllowedException', messageException);
}

/// A classe [HttpNoConnectionException] é uma exceção específica para erros de falta de conexão em requisições HTTP.
/// Ela também herda da classe [HTTPZukException].
class HttpNoConnectionException extends HTTPZukException {
  const HttpNoConnectionException([String? messageException])
      : super('HttpNoConnectionException', messageException);
}

/// A classe [HttpRequestException] é uma exceção genérica para erros em requisições HTTP.
/// Ela também herda da classe [HTTPZukException].
class HttpRequestException extends HTTPZukException {
  const HttpRequestException([String? messageException])
      : super('HttpRequestException', messageException);
}

/// A classe abstrata [HTTPZukException] é a classe base para todas as exceções relacionadas a requisições HTTP.
/// Ela implementa a interface [ZukException] e possui um construtor que recebe o nome da classe e uma mensagem opcional.
abstract class HTTPZukException implements ZukException {
  const HTTPZukException(
    this.className, [
    this.message,
  ]);
  @override
  final String? message;
  @override
  final String className;
}
