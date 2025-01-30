import 'package:zukcore/src/core.dart';

/// A classe abstrata "ZukBiometryFailure" é uma implementação da interface [ZukException].
/// Ela define uma estrutura básica para exceções relacionadas a falhas na biometria no contexto do sistema Zuk.
/// A classe possui um construtor que recebe o nome da classe que a está estendendo e uma mensagem opcional.
abstract class ZukBiometryFailure implements ZukException {
  const ZukBiometryFailure(
    this.className, [
    this.message,
  ]);
  @override
  final String? message;
  @override
  final String className;
}

/// As subclasses [ZukBiometryRequestError], [ZukBiometryUnauthorizedError],
/// [ZukBiometryForbiddenError], [ZukBiometryInternalError] e [ZukBiometryUnkownError]
/// estendem a classe [ZukBiometryFailure] e representam diferentes tipos de falhas relacionadas à biometria.
/// Cada uma delas possui um construtor que chama o construtor da classe pai e passa o nome da classe específica
/// e uma mensagem opcional.
///
///Essas classes podem ser utilizadas para capturar e tratar exceções específicas relacionadas a falhas na biometria no sistema Zuk.
class ZukBiometryRequestError extends ZukBiometryFailure {
  const ZukBiometryRequestError([String? messageException])
      : super('ZukBiometryRequestError', messageException);
}

/// As subclasses [ZukBiometryRequestError], [ZukBiometryUnauthorizedError],
/// [ZukBiometryForbiddenError], [ZukBiometryInternalError] e [ZukBiometryUnkownError]
/// estendem a classe [ZukBiometryFailure] e representam diferentes tipos de falhas relacionadas à biometria.
/// Cada uma delas possui um construtor que chama o construtor da classe pai e passa o nome da classe específica
/// e uma mensagem opcional.
///
///Essas classes podem ser utilizadas para capturar e tratar exceções específicas relacionadas a falhas na biometria no sistema Zuk.
class ZukBiometryUnauthorizedError extends ZukBiometryFailure {
  const ZukBiometryUnauthorizedError([String? messageException])
      : super('ZukBiometryUnauthorizedError', messageException);
}

/// As subclasses [ZukBiometryRequestError], [ZukBiometryUnauthorizedError],
/// [ZukBiometryForbiddenError], [ZukBiometryInternalError] e [ZukBiometryUnkownError]
/// estendem a classe [ZukBiometryFailure] e representam diferentes tipos de falhas relacionadas à biometria.
/// Cada uma delas possui um construtor que chama o construtor da classe pai e passa o nome da classe específica
/// e uma mensagem opcional.
///
///Essas classes podem ser utilizadas para capturar e tratar exceções específicas relacionadas a falhas na biometria no sistema Zuk.
class ZukBiometryForbiddenError extends ZukBiometryFailure {
  const ZukBiometryForbiddenError([String? messageException])
      : super('ZukBiometryForbiddenError', messageException);
}

/// As subclasses [ZukBiometryRequestError], [ZukBiometryUnauthorizedError],
/// [ZukBiometryForbiddenError], [ZukBiometryInternalError] e [ZukBiometryUnkownError]
/// estendem a classe [ZukBiometryFailure] e representam diferentes tipos de falhas relacionadas à biometria.
/// Cada uma delas possui um construtor que chama o construtor da classe pai e passa o nome da classe específica
/// e uma mensagem opcional.
///
///Essas classes podem ser utilizadas para capturar e tratar exceções específicas relacionadas a falhas na biometria no sistema Zuk.
class ZukBiometryInternalError extends ZukBiometryFailure {
  const ZukBiometryInternalError([String? messageException])
      : super('ZukBiometryInternalError', messageException);
}

/// As subclasses [ZukBiometryRequestError], [ZukBiometryUnauthorizedError],
/// [ZukBiometryForbiddenError], [ZukBiometryInternalError] e [ZukBiometryUnkownError]
/// estendem a classe [ZukBiometryFailure] e representam diferentes tipos de falhas relacionadas à biometria.
/// Cada uma delas possui um construtor que chama o construtor da classe pai e passa o nome da classe específica
/// e uma mensagem opcional.
///
///Essas classes podem ser utilizadas para capturar e tratar exceções específicas relacionadas a falhas na biometria no sistema Zuk.
class ZukBiometryUnkownError extends ZukBiometryFailure {
  const ZukBiometryUnkownError([String? messageException])
      : super('ZukBiometryUnkownError', messageException);
}
