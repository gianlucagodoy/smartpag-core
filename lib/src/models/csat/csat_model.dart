// ignore_for_file: must_be_immutable

import 'dart:convert';
import 'package:equatable/equatable.dart';

///
/// Classe que representa o objeto CSAT
///
class CSAT extends Equatable {
  CSATInfos? serviceToken;

  CSAT({
    this.serviceToken,
  }) {
    serviceToken ??= CSATInfos();
  }

  @override
  List<Object?> get props => [serviceToken];

  ///
  /// Converte o objeto para um Map<String, dynamic>
  ///
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "serviceToken": (serviceToken ?? CSATInfos()).toMap(),
    };

    return map;
  }

  ///
  /// Cria um objeto CSAT a partir de um Map<String, dynamic>
  ///
  static CSAT fromMap(Map<String, dynamic> map) {
    CSAT csat = CSAT(
      serviceToken: map['serviceToken'] != null ? CSATInfos.fromMap(map['serviceToken']) : CSATInfos(),
    );

    return csat;
  }

  ///
  /// Converte o objeto para uma string JSON
  ///
  String toJson() => json.encode(toMap());

  ///
  /// Cria um objeto CSAT a partir de uma string JSON
  ///
  static CSAT fromJson(String source) => fromMap(json.decode(source));
}

///
/// Classe que representa as informações do CSAT
///
class CSATInfos extends Equatable {
  int quantityModalOpens;
  bool dontShowModal;

  CSATInfos({
    this.quantityModalOpens = 0,
    this.dontShowModal = false,
  });

  @override
  List<Object> get props => [quantityModalOpens, dontShowModal];

  ///
  /// Converte o objeto para um Map<String, dynamic>
  ///
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "quantityModalOpens": quantityModalOpens,
      "dontShowModal": dontShowModal,
    };

    return map;
  }

  ///
  /// Cria um objeto CSATInfos a partir de um Map<String, dynamic>
  ///
  static CSATInfos fromMap(Map<String, dynamic> map) {
    CSATInfos csatInfos = CSATInfos(
      quantityModalOpens: map['quantityModalOpens'],
      dontShowModal: map['dontShowModal'],
    );

    return csatInfos;
  }
}
