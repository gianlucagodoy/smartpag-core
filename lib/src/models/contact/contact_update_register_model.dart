import 'package:equatable/equatable.dart';

///
/// A classe [ContactUpdateRegister] representa o objeto de resposta para atualização e registro de contatos.
/// Ela contém informações como código de status, sinalizador de sucesso, sinalizador de erro e dados.
///
///
/// A classe [DataUpdateRegister] representa o objeto de dados para atualização e registro de contatos.
/// Ela contém informações como ID do telefone, número de telefone, ID do e-mail, e-mail,
/// ID do domínio de e-mail, domínio de e-mail, mensagem e sinalizador de exibição de mensagem.
///
/// As classes também implementam a classe [Equatable] para facilitar a comparação e verificação
/// de igualdade.
///
class ContactUpdateRegister extends Equatable {
  final int statusCode;
  final bool sucess;
  final bool errors;
  final DataUpdateRegister? data;

  const ContactUpdateRegister({
    required this.statusCode,
    required this.sucess,
    required this.errors,
    required this.data,
  });

  @override
  List<Object> get props => [];

  static ContactUpdateRegister fromMap(Map<String, dynamic> map) {
    return ContactUpdateRegister(
      statusCode: map['statusCode'] ?? 0,
      sucess: map['sucess'] ?? false,
      errors: map['errors'] ?? false,
      data: map['data'] != null && map['data'] is Map<String, dynamic> ? DataUpdateRegister.fromMap(map['data']) : null,
    );
  }
}

class DataUpdateRegister extends Equatable {
  final int phoneId;
  final String phoneNumber;
  final int emailId;
  final String email;
  final int idEmailDomain;
  final String emailDomain;
  final String message;
  final bool showMessage;

  const DataUpdateRegister({
    required this.phoneId,
    required this.phoneNumber,
    required this.emailId,
    required this.email,
    required this.idEmailDomain,
    required this.emailDomain,
    required this.message,
    required this.showMessage,
  });

  @override
  List<Object> get props => [];

  static DataUpdateRegister fromMap(Map<String, dynamic> map) {
    return DataUpdateRegister(
      phoneId: map['phoneId'] ?? 0,
      phoneNumber: map['phoneNumber'] ?? '',
      emailId: map['emailId'] ?? 0,
      email: map['email'] ?? '',
      idEmailDomain: map['idEmailDomain'] ?? 0,
      emailDomain: map['emailDomain'] ?? '',
      message: map['message'] ?? '',
      showMessage: map['showMessage'] ?? false,
    );
  }
}
