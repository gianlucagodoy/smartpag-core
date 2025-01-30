import '../../interfaces/exceptions/zuk_exceptions.dart';

/// A classe [HttpTimeOutException] é uma exceção específica para erros de tempo limite em requisições HTTP.
/// Ela herda da classe [HTTPSmartException].
class HttpTimeOutException extends HTTPSmartException {
  const HttpTimeOutException([String? messageException])
      : super('HttpTimeOutException', messageException);
}

/// A classe [HttpMethodNotAlloAllowedException] é uma exceção específica para erros de método HTTP não permitido.
/// Ela também herda da classe [HTTPSmartException] .
class HttpMethodNotAlloAllowedException extends HTTPSmartException {
  const HttpMethodNotAlloAllowedException([String? messageException])
      : super('HttpMethodNotAlloAllowedException', messageException);
}

/// A classe [HttpNoConnectionException] é uma exceção específica para erros de falta de conexão em requisições HTTP.
/// Ela também herda da classe [HTTPSmartException].
class HttpNoConnectionException extends HTTPSmartException {
  const HttpNoConnectionException([String? messageException])
      : super('HttpNoConnectionException', messageException);
}

/// A classe [HttpRequestException] é uma exceção genérica para erros em requisições HTTP.
/// Ela também herda da classe [HTTPSmartException].
class HttpRequestException extends HTTPSmartException {
  const HttpRequestException([String? messageException])
      : super('HttpRequestException', messageException);
}

/// A classe abstrata [HTTPSmartException] é a classe base para todas as exceções relacionadas a requisições HTTP.
/// Ela implementa a interface [SmartException] e possui um construtor que recebe o nome da classe e uma mensagem opcional.
abstract class HTTPSmartException implements SmartException {
  const HTTPSmartException(
    this.className, [
    this.message,
  ]);
  @override
  final String? message;
  @override
  final String className;
}
