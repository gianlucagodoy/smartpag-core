// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

///
/// A classe [Pdv] representa um ponto de venda (PDV) e estende a classe [Equatable],
/// que é usada para comparar objetos de forma mais fácil.
///
/// Os atributos da classe incluem:
///
/// - [merchantId]: o ID do comerciante associado ao PDV.
///
/// - [pdvNumber]: o número do PDV.
///
/// - [receiptMerchantName]: o nome do comerciante na fatura.
///
/// - [serial]: o número de série do PDV.
///
/// - [password]: a senha do PDV.
///
/// - [activationDate]: a data de ativação do PDV.
///
/// - [hasGeneralPassword]: um indicador se o PDV possui uma senha geral.
///
/// - [generalPassword]: a senha geral do PDV.
///
/// - [isPasswordVisible]: um indicador se a senha do PDV está visível.
///
///
/// O construtor da classe permite definir todos esses atributos. Alguns atributos têm valores padrão,
/// como [hasGeneralPassword] e [isPasswordVisible], que são definidos como false.
///
/// A classe também implementa o método [fromMap], que converte um Map<String,dynamic> de dados em um objeto "Pdv".
/// Isso é útil ao receber dados de uma fonte externa, como um banco de dados.
/// O método extrai os valores do Map<String,dynamic> e os atribui aos atributos correspondentes do objeto "Pdv".
/// Além disso, verifica se a senha do PDV é nula ou vazia para definir corretamente o valor de [hasGeneralPassword].
///
class Pdv extends Equatable {
  ///
  /// o ID do comerciante associado ao PDV.
  ///
  int? merchantId;

  ///
  /// o número do PDV.
  ///
  int? pdvNumber;

  ///
  /// o nome do comerciante na fatura.
  ///
  String? receiptMerchantName;

  ///
  /// o número de série do PDV.
  ///
  String? serial;

  ///
  /// a senha do PDV.
  ///
  String? password;

  ///
  /// a data de ativação do PDV.
  ///
  DateTime? activationDate;

  ///
  /// um indicador se o PDV possui uma senha geral.
  ///
  bool hasGeneralPassword;

  ///
  ///  senha geral do PDV.
  ///
  String? generalPassword;

  ///
  /// um indicador se a senha do PDV está visível.
  ///
  bool isPasswordVisible;

  Pdv({
    this.merchantId,
    this.pdvNumber,
    this.receiptMerchantName,
    this.serial,
    this.password,
    this.activationDate,
    this.hasGeneralPassword = false,
    this.generalPassword,
    this.isPasswordVisible = false,
  });

  @override
  List<Object?> get props => [merchantId, pdvNumber, receiptMerchantName, serial, password, activationDate, hasGeneralPassword, generalPassword, isPasswordVisible];

  ///
  /// Método [fromMap], que converte um Map<String,dynamic> de dados em um objeto "Pdv".
  /// Isso é útil ao receber dados de uma fonte externa, como um banco de dados.
  ///
  static Pdv fromMap(Map<String, dynamic> map) {
    Pdv pdv = Pdv(
      merchantId: map['merchantId'],
      pdvNumber: map['pdvNumber'],
      receiptMerchantName: map['receiptMerchantName'],
      serial: map['serial'],
      password: map['passwordPdv'],
      activationDate: map['activationDate'],
      hasGeneralPassword: map['passwordPdv'] == null || map['passwordPdv'].isEmpty,
    );

    return pdv;
  }
}





