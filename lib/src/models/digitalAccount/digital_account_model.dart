import 'package:equatable/equatable.dart';

///
/// A classe [DigitalAccount] representa uma conta digital e contém informações como mensagem,
/// mensagem de status, se há uma oferta de conta, código de status e status da conta.
/// Ela implementa a classe [Equatable] para facilitar a comparação entre objetos.
///
/// A função [toMap] converte um objeto [DigitalAccount] em um [Map] de chave-valor para facilitar a serialização.
///
/// A função estática [fromMap] converte um mapa de chave-valor em um objeto [DigitalAccount].
/// Se o parâmetro [isSimplified] for verdadeiro, a função irá criar um objeto [DigitalAccount] com informações
/// básicas, caso contrário, ela irá extrair as informações do mapa completo da conta digital.
///
/// Em resumo, a classe [DigitalAccount] é usada para representar uma conta digital e as informações
/// relacionadas a ela.
///
// ignore: must_be_immutable
class DigitalAccount extends Equatable {
  String? message;
  String? statusMessage;
  bool? hasAccountOffer;
  int? statusCode;
  int? accountStatus;

  DigitalAccount({
    this.message,
    this.statusMessage,
    this.hasAccountOffer = false,
    this.statusCode,
    this.accountStatus,
  });

  @override
  List<Object?> get props => [message, statusMessage, hasAccountOffer, statusCode, accountStatus];

  ///
  /// A função [toMap] converte um objeto [DigitalAccount] em um [Map] de chave-valor para facilitar a serialização.
  ///
  Map<String, dynamic> toMap() {
    Map<String, dynamic> result = {
      "message": message,
      "statusMessage": statusMessage,
      "offerAccount": hasAccountOffer,
      "statusCode": statusCode,
      "accountStatus": accountStatus,
    };

    return result;
  }

  /// A função estática [fromMap] converte um mapa de chave-valor em um objeto [DigitalAccount].
  /// Se o parâmetro [isSimplified] for verdadeiro, a função irá criar um objeto [DigitalAccount] com informações
  /// básicas, caso contrário, ela irá extrair as informações do mapa completo da conta digital.
  static DigitalAccount fromMap(Map<String, dynamic> map, {bool isSimplified = false}) {
    if (isSimplified) {
      DigitalAccount digitalAccount = DigitalAccount(
        message: map["message"],
        statusMessage: map["statusMessage"],
        hasAccountOffer: map["offerAccount"],
        statusCode: map["statusCode"],
        accountStatus: map["accountStatus"],
      );
      return digitalAccount;
    }
    DigitalAccount digitalAccount = DigitalAccount(
      message: map['message'],
      statusCode: map['statusCode'],
      accountStatus: map['value'] == null ? null : map['value']['statusConta']['id'],
      statusMessage: map['value'] == null ? null : map['value']['statusConta']['mensagem'],
      hasAccountOffer: map['statusCode'] == 200 ? (map['value'] == null ? null : map['value']['ofertarConta']) ?? false : false,
    );

    return digitalAccount;
  }
}
