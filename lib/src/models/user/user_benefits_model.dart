// ignore_for_file: must_be_immutable

import 'package:zukcore/src/models/user/user_data_model.dart';
import 'package:equatable/equatable.dart';

///
/// Classe que representa os benefícios do usuário
///
class UserBenefits extends Equatable {
  UserData? userData;

  ///
  /// Construtor da classe
  ///
  UserBenefits({this.userData});

  @override
  List<Object?> get props => [userData];

  ///
  /// Converte a classe em um Map<String, dynamic> de chave-valor
  ///
  Map<String, dynamic> toMap() {
    Map<String, dynamic> result = {
      "userData": userData?.toMap(),
    };
    return result;
  }

  ///
  /// Cria uma instância da classe a partir de um Map<String, dynamic> de chave-valor
  ///
  static UserBenefits fromMap(Map<String, dynamic> map) {
    UserBenefits userBenefits = UserBenefits(
      userData:
          map['userData'] != null ? UserData.fromMap(map['userData']) : null,
    );

    return userBenefits;
  }
}
