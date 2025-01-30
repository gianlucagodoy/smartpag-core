import '../../interfaces/exceptions/zuk_exceptions.dart';

/// A classe abstrata "SmartBiometryFailure" é uma implementação da interface [SmartException].
/// Ela define uma estrutura básica para exceções relacionadas a falhas na biometria no contexto do sistema Smart.
/// A classe possui um construtor que recebe o nome da classe que a está estendendo e uma mensagem opcional.
abstract class SmartBiometryFailure implements SmartException {
  const SmartBiometryFailure(
    this.className, [
    this.message,
  ]);
  @override
  final String? message;
  @override
  final String className;
}

/// As subclasses [SmartBiometryRequestError], [SmartBiometryUnauthorizedError],
/// [SmartBiometryForbiddenError], [SmartBiometryInternalError] e [SmartBiometryUnkownError]
/// estendem a classe [SmartBiometryFailure] e representam diferentes tipos de falhas relacionadas à biometria.
/// Cada uma delas possui um construtor que chama o construtor da classe pai e passa o nome da classe específica
/// e uma mensagem opcional.
///
///Essas classes podem ser utilizadas para capturar e tratar exceções específicas relacionadas a falhas na biometria no sistema Smart.
class SmartBiometryRequestError extends SmartBiometryFailure {
  const SmartBiometryRequestError([String? messageException])
      : super('SmartBiometryRequestError', messageException);
}

/// As subclasses [SmartBiometryRequestError], [SmartBiometryUnauthorizedError],
/// [SmartBiometryForbiddenError], [SmartBiometryInternalError] e [SmartBiometryUnkownError]
/// estendem a classe [SmartBiometryFailure] e representam diferentes tipos de falhas relacionadas à biometria.
/// Cada uma delas possui um construtor que chama o construtor da classe pai e passa o nome da classe específica
/// e uma mensagem opcional.
///
///Essas classes podem ser utilizadas para capturar e tratar exceções específicas relacionadas a falhas na biometria no sistema Smart.
class SmartBiometryUnauthorizedError extends SmartBiometryFailure {
  const SmartBiometryUnauthorizedError([String? messageException])
      : super('SmartBiometryUnauthorizedError', messageException);
}

/// As subclasses [SmartBiometryRequestError], [SmartBiometryUnauthorizedError],
/// [SmartBiometryForbiddenError], [SmartBiometryInternalError] e [SmartBiometryUnkownError]
/// estendem a classe [SmartBiometryFailure] e representam diferentes tipos de falhas relacionadas à biometria.
/// Cada uma delas possui um construtor que chama o construtor da classe pai e passa o nome da classe específica
/// e uma mensagem opcional.
///
///Essas classes podem ser utilizadas para capturar e tratar exceções específicas relacionadas a falhas na biometria no sistema Smart.
class SmartBiometryForbiddenError extends SmartBiometryFailure {
  const SmartBiometryForbiddenError([String? messageException])
      : super('SmartBiometryForbiddenError', messageException);
}

/// As subclasses [SmartBiometryRequestError], [SmartBiometryUnauthorizedError],
/// [SmartBiometryForbiddenError], [SmartBiometryInternalError] e [SmartBiometryUnkownError]
/// estendem a classe [SmartBiometryFailure] e representam diferentes tipos de falhas relacionadas à biometria.
/// Cada uma delas possui um construtor que chama o construtor da classe pai e passa o nome da classe específica
/// e uma mensagem opcional.
///
///Essas classes podem ser utilizadas para capturar e tratar exceções específicas relacionadas a falhas na biometria no sistema Smart.
class SmartBiometryInternalError extends SmartBiometryFailure {
  const SmartBiometryInternalError([String? messageException])
      : super('SmartBiometryInternalError', messageException);
}

/// As subclasses [SmartBiometryRequestError], [SmartBiometryUnauthorizedError],
/// [SmartBiometryForbiddenError], [SmartBiometryInternalError] e [SmartBiometryUnkownError]
/// estendem a classe [SmartBiometryFailure] e representam diferentes tipos de falhas relacionadas à biometria.
/// Cada uma delas possui um construtor que chama o construtor da classe pai e passa o nome da classe específica
/// e uma mensagem opcional.
///
///Essas classes podem ser utilizadas para capturar e tratar exceções específicas relacionadas a falhas na biometria no sistema Smart.
class SmartBiometryUnkownError extends SmartBiometryFailure {
  const SmartBiometryUnkownError([String? messageException])
      : super('SmartBiometryUnkownError', messageException);
}
