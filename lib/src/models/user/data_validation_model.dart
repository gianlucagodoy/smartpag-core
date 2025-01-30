// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

///
/// Classe para validação de dados.
///
/// A classe herda da classe [Equatable] do pacote equatable para facilitar a comparação de objetos.
///
class DataValidation extends Equatable {
  ///
  /// Armazena o email a ser validado.
  ///
  String? email;

  ///
  /// Armazena o telefone a ser validado.
  ///
  String? phone;

  ///
  /// Armazena a mensagem de erro para telefone inválido.
  ///
  String? phoneMessage;

  ///
  /// Armazena a mensagem de erro para email inválido.
  ///
  String? emailMessage;

  ///
  /// Armazena o token de texto para validação do telefone.
  ///
  String? phoneTextToken;

  ///
  /// Armazena o token de texto para validação do email.
  ///
  String? emailTextToken;

  ///
  /// Construtor da classe.
  ///
  DataValidation({
    this.email,
    this.phone,
    this.phoneMessage,
    this.emailMessage,
    this.phoneTextToken,
    this.emailTextToken,
  });

  ///
  /// Sobrescrita do método props da classe [Equatable].
  /// Define as propriedades que serão utilizadas para comparar objetos dessa classe.
  ///
  @override
  List<Object?> get props => [email, phone, phoneMessage, emailMessage, phoneTextToken, emailTextToken];

  ///
  /// Método para converter a classe em um Map<String, dynamic>.
  ///
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'email': email,
      'phone': phone,
      'phoneMessage': phoneMessage,
      'emailMessage': emailMessage,
      'phoneTextToken': phoneTextToken,
      'emailTextToken': emailTextToken,
    };

    return map;
  }

  ///
  /// Método estático para criar uma instância da classe a partir de um Map<String, dynamic>.
  ///
  static DataValidation fromMap(Map<String, dynamic> map) {
    DataValidation dataValidation = DataValidation(
      email: map['email'],
      phone: map['phone'],
      phoneMessage: map['phoneMessage'],
      emailMessage: map['emailMessage'],
      phoneTextToken: map['phoneTextToken'],
      emailTextToken: map['emailTextToken'],
    );

    return dataValidation;
  }
}
