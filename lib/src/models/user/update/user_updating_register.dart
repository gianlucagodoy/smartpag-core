// ignore_for_file: must_be_immutable
import 'package:equatable/equatable.dart';

///
/// Classe [UserUpdatingRegister] é responsável por armazenar informações de atualização de
/// registro do usuário, como token, tipo de registro e tipo de contato.
///
class UserUpdatingRegister extends Equatable {
  String? token;
  String? registerType;
  String? contactType;

  UserUpdatingRegister({
    this.token,
    this.registerType,
    this.contactType,
  });

  @override
  List<Object?> get props => [token, registerType, contactType];

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'token': token,
      'registerType': registerType,
      'contactType': contactType,
    };

    return map;
  }

  static UserUpdatingRegister fromMap(Map<String, dynamic> map) {
    UserUpdatingRegister updatingRegister = UserUpdatingRegister(
      token: map['token'],
      registerType: map['registerType'],
      contactType: map['contactType'],
    );

    return updatingRegister;
  }
}

///
/// A classe [PhoneMessage] representa uma mensagem de telefone,
/// contendo um número e uma mensagem
///
class PhoneMessage extends Equatable {
  final int number;
  final String message;

  const PhoneMessage({
    required this.number,
    required this.message,
  });

  @override
  List<Object> get props => [number, message];

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "number": number,
      "message": message,
    };

    return map;
  }

  static PhoneMessage fromMap(Map<String, dynamic> map) {
    PhoneMessage phoneMessage = PhoneMessage(
      number: map['number'] ?? 0,
      message: map['message'] ?? '',
    );

    return phoneMessage;
  }
}

///
/// A classe [EmailMessage] representa uma mensagem de e-mail,
/// contendo um número e uma mensagem.
///
class EmailMessage extends Equatable {
  final int number;
  final String message;

  const EmailMessage({
    required this.number,
    required this.message,
  });

  @override
  List<Object> get props => [number, message];

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "number": number,
      "message": message,
    };

    return map;
  }

  static EmailMessage fromMap(Map<String, dynamic> map) {
    EmailMessage emailMessage = EmailMessage(
      number: map['number'] ?? 0,
      message: map['message'] ?? '',
    );

    return emailMessage;
  }
}

///
/// A classe [TokenMessage] representa uma mensagem de token,
/// contendo um número e uma mensagem.
///
class TokenMessage extends Equatable {
  final int number;
  final String message;

  const TokenMessage({
    required this.number,
    required this.message,
  });

  @override
  List<Object> get props => [number, message];

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "number": number,
      "message": message,
    };

    return map;
  }

  static TokenMessage fromMap(Map<String, dynamic> map) {
    TokenMessage tokenMessage = TokenMessage(
      number: map['number'] ?? 0,
      message: map['message'] ?? '',
    );

    return tokenMessage;
  }
}
