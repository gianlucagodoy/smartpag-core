// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:equatable/equatable.dart';

///
/// A classe [UserData] representa os dados do usuário, contendo as informações do usuário e a URL relacionada.
///
/// A classe [UserInfo] representa as informações detalhadas do usuário, como ID, nome, CPF/CNPJ, email, telefone,
/// endereço, RG, entidade emissora, data de nascimento, nacionalidade, estado civil, documento do proprietário,
/// nome completo do proprietário, perfil de convite, data de expiração, nome da empresa, nome completo,
/// documento principal, telefone principal, CEP, número, bairro, cidade, estado e inscrição estadual.
///
/// A classe [UserData] implementa a classe Equatable para permitir a comparação de igualdade entre objetos [UserData].
///
/// A classe [UserInfo] também implementa a classe [Equatable] para permitir a comparação de igualdade entre objetos
/// [UserInfo].
///
/// Ambas as classes possuem um método [toMap] para converter os objetos em um mapa de chave-valor,
/// e um método estático [fromMap] para criar um objeto a partir de um mapa de chave-valor.
///
class UserData extends Equatable {
  late final UserInfo userInfo;
  late final String url;

  UserData({
    required this.userInfo,
    required this.url,
  });

  @override
  List<Object?> get props => [userInfo, url];

  Map<String, dynamic> toMap() {
    return {
      "userInfo": userInfo.toMap(),
      "url": url,
    };
  }

  static UserData fromMap(Map<String, dynamic> map) {
    return UserData(
      userInfo: UserInfo.fromMap(map['userInfo']),
      url: map['url'] ?? "",
    );
  }
}

///
/// A classe [UserInfo] representa as informações detalhadas do usuário, como ID, nome, CPF/CNPJ, email, telefone,
/// endereço, RG, entidade emissora, data de nascimento, nacionalidade, estado civil, documento do proprietário,
/// nome completo do proprietário, perfil de convite, data de expiração, nome da empresa, nome completo,
/// documento principal, telefone principal, CEP, número, bairro, cidade, estado e inscrição estadual.
///
class UserInfo extends Equatable {
  final int ZukId;
  final String? name;
  final String? cpfCnpj;
  final String? email;
  final String? phone;
  final String? address;
  final String? rg;
  final String? issuingEntity;
  final String? birthDay;
  final String? nationality;
  final String? maritalStatus;
  final String? ownerDocument;
  final String? ownerFullName;
  final int? invitationProfile;
  final String? expirationDate;
  final String? corporateName;
  final String? fullName;
  final String? mainDocument;
  final String? primaryPhone;
  final String? zipCode;
  final String? number;
  final String? neighborhood;
  final String? city;
  final String? state;
  final String? ie;

  const UserInfo({
    required this.ZukId,
    required this.name,
    required this.cpfCnpj,
    required this.email,
    required this.phone,
    required this.address,
    required this.rg,
    required this.issuingEntity,
    required this.birthDay,
    required this.nationality,
    required this.maritalStatus,
    required this.ownerDocument,
    required this.ownerFullName,
    required this.invitationProfile,
    required this.expirationDate,
    required this.corporateName,
    required this.fullName,
    required this.mainDocument,
    required this.primaryPhone,
    required this.zipCode,
    required this.number,
    required this.neighborhood,
    required this.city,
    required this.state,
    required this.ie,
  });

  @override
  List<Object?> get props => [
        ZukId,
        name,
        cpfCnpj,
        email,
        phone,
        address,
        rg,
        issuingEntity,
        birthDay,
        nationality,
        maritalStatus,
        ownerDocument,
        ownerFullName,
        invitationProfile,
        expirationDate,
        corporateName,
        fullName,
        mainDocument,
        primaryPhone,
        zipCode,
        number,
        neighborhood,
        city,
        state,
        ie
      ];

  Map<String, dynamic> toMap() {
    return {
      "ZukId": ZukId,
      "name": name,
      "cpfCnpj": cpfCnpj,
      "email": email,
      "phone": phone,
      "address": address,
      "birthDay": birthDay,
      "expirationDate": expirationDate,
      "invitationProfile": invitationProfile,
      "issuingEntity": issuingEntity,
      "maritalStatus": maritalStatus,
      "nationality": nationality,
      "ownerDocument": ownerDocument,
      "ownerFullName": ownerFullName,
      "rg": rg,
      "city": city,
      "corporateName": corporateName,
      "fullName": fullName,
      "mainDocument": mainDocument,
      "municipalRegistration": ie,
      "neighborhood": neighborhood,
      "number": number,
      "primaryPhone": primaryPhone,
      "state": state,
      "zipCode": zipCode,
    };
  }

  static UserInfo fromMap(Map<String, dynamic> map) {
    return UserInfo(
      ZukId: map['ZukId'] ?? 0,
      name: map['name'] ?? "",
      cpfCnpj: map['cpfCnpj'] ?? "",
      email: map['email'] ?? "",
      phone: map['phone'] ?? "",
      address: map['address'] ?? "",
      birthDay: map['birthDay'] ?? "",
      expirationDate: map['expirationDate'] ?? "",
      invitationProfile: map['invitationProfile'] ?? 0,
      issuingEntity: map['issuingEntity'] ?? "",
      maritalStatus: map['maritalStatus'] ?? "",
      nationality: map['nationality'] ?? "",
      ownerDocument: map['ownerDocument'] ?? "",
      ownerFullName: map['ownerFullName'] ?? "",
      rg: map['rg'] ?? "",
      city: map['city'] ?? "",
      corporateName: map['corporateName'] ?? "",
      fullName: map['fullName'] ?? "",
      mainDocument: map['mainDocument'] ?? "",
      ie: map['ie'] ?? "",
      neighborhood: map['neighborhood'] ?? "",
      number: map['number'] ?? "",
      primaryPhone: map['primaryPhone'] ?? "",
      state: map['state'] ?? "",
      zipCode: map['zipCode'] ?? "",
    );
  }
}
