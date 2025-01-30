// ignore_for_file: must_be_immutable

import 'dart:convert';
import 'package:corsac_jwt/corsac_jwt.dart';
import 'package:equatable/equatable.dart';
import '../digitalAccount/digital_account_model.dart';
import 'data_validation_model.dart';
import 'merchant_model.dart';
import 'update/user_updating_register.dart';
import 'user_benefits_model.dart';
import 'user_notification.dart';

///
/// A classe [User] representa um usuário no sistema. Ela possui os seguintes atributos:
///
/// - id: o identificador único do usuário.
///
/// - name: o nome do usuário.
///
/// - token: o token de autenticação do usuário.
///
/// - password: a senha do usuário.
///
/// - dataValidation: um objeto do tipo DataValidation que contém informações de validação dos dados do usuário, como email e telefone.
///
/// - client: um objeto do tipo Merchant que representa o cliente associado ao usuário.
///
/// - pages: uma lista de strings que representa as páginas associadas ao usuário.
///
/// - services: uma lista de strings que representa os serviços associados ao usuário.
///
/// - digitalAccount: um objeto do tipo DigitalAccount que representa a conta digital associada ao usuário.
///
/// - pendingContracts: uma lista de strings que representa os contratos pendentes do usuário.
///
/// - userBenefits: um objeto do tipo UserBenefits que representa os benefícios do usuário.
///
/// - userNotification: um objeto do tipo UserNotification que representa as notificações do usuário.
///
/// - userUpdatingRegister: um objeto do tipo UserUpdatingRegister que representa o registro de atualização do usuário.
///
/// A classe possui métodos para converter o objeto em um mapa de chave-valor,
/// obter itens do token de autenticação e converter o objeto para JSON.
///
class User extends Equatable {
  ///
  /// o identificador único do usuário.
  ///
  int? id;

  ///
  /// o nome do usuário.
  ///
  String? name;

  ///
  /// o token de autenticação do usuário.
  ///
  String? token;

  ///
  /// a senha do usuário.
  ///
  String? password;

  ///
  /// um objeto do tipo DataValidation que contém informações de validação dos dados do usuário, como email e telefone.
  ///
  DataValidation? dataValidation;

  ///
  /// um objeto do tipo Merchant que representa o cliente associado ao usuário.
  ///
  Merchant? client;

  ///
  /// uma lista de strings que representa as páginas associadas ao usuário.
  ///
  List<String>? pages;

  ///
  /// uma lista de strings que representa os serviços associados ao usuário.
  ///
  List<String>? services;

  ///
  /// um objeto do tipo DigitalAccount que representa a conta digital associada ao usuário.
  ///
  DigitalAccount? digitalAccount;

  ///
  /// uma lista de strings que representa os contratos pendentes do usuário.
  ///
  List<String> pendingContracts;

  ///
  /// um objeto do tipo UserBenefits que representa os benefícios do usuário.
  ///
  UserBenefits? userBenefits;

  ///
  /// um objeto do tipo UserNotification que representa as notificações do usuário.
  ///
  UserNotification? userNotification;

  ///
  /// um objeto do tipo UserUpdatingRegister que representa o registro de atualização do usuário.
  ///
  UserUpdatingRegister? userUpdatingRegister;

  User({
    this.id,
    this.name,
    this.token,
    this.password,
    this.dataValidation,
    this.client,
    this.pages,
    this.services,
    this.digitalAccount,
    this.pendingContracts = const [],
    this.userBenefits,
    this.userNotification,
    this.userUpdatingRegister,
  });

  @override
  List<Object?> get props =>
      [id, name, token, password, dataValidation, client, pages, services, digitalAccount, pendingContracts, userBenefits, userNotification, userUpdatingRegister];

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "id": id,
      "name": name,
      "token": token,
      "email": dataValidation?.email,
      "phoneNumber": dataValidation?.phone,
      "password": password,
      "dataValidation": dataValidation?.toMap(),
      "client": client?.toMap(),
      "pages": pages,
      "pendingContracts": pendingContracts,
      "services": services,
      "digitalAccount": digitalAccount?.toMap(),
      "userBenefits": userBenefits?.toMap(),
      "notification": userNotification?.toMap(),
      "userUpdatingRegister": userUpdatingRegister?.toMap(),
    };

    return map;
  }

  static List<String> getTokenItems(String token, String key) {
    if (token.isEmpty) return <String>[];

    List<String> items = [];
    JWT decodedToken = JWT.parse(token);
    final result = decodedToken.getClaim(key);
    if (result is List) {
      items = result.map((e) {
        return e.toString();
      }).toList();
    } else {
      items.add(result.toString());
    }
    return items;
  }

  static User fromMap(Map<String, dynamic> map) {
    User userModel = User(
      id: map['id'],
      name: map['name'],
      token: map['token'],
      password: map['password'],
      dataValidation: map['dataValidation'] != null
          ? DataValidation.fromMap(map['dataValidation'])
          : map['email'] != null || map['phoneNumber'] != null
              ? DataValidation(email: map['email'], phone: map['phoneNumber'])
              : null,
      client: map['client'] != null ? Merchant.fromMap(map['client'], map['token']) : null,
      pages: getTokenItems(map['token'] ?? "", 'pages'),
      services: getTokenItems(map['token'] ?? "", 'services'),
      pendingContracts: List<String>.from(map['pendingContracts'] ?? []),
      digitalAccount: map['digitalAccount'] != null ? DigitalAccount.fromMap(map['digitalAccount'], isSimplified: true) : null,
      userBenefits: map['userBenefits'] != null ? UserBenefits.fromMap(map['userBenefits']) : null,
      userNotification: map['notification'] != null ? UserNotification.fromMap(map['notification']) : null,
      userUpdatingRegister: map['userUpdatingRegister'] != null ? UserUpdatingRegister.fromMap(map['userUpdatingRegister']) : null,
    );

    return userModel;
  }

  String toJson() => json.encode(toMap());

  static User fromJson(String source) => fromMap(json.decode(source));
}
