// ignore_for_file: must_be_immutable
import 'package:equatable/equatable.dart';

import '../order/order_status_model.dart';

///
/// Classe que representa um benefício
///
class Benefit extends Equatable {
  final int id;
  final String name;
  final String description;
  final String icon;
  final Status? status;
  bool? isChecked;

  Benefit({
    required this.id,
    required this.name,
    required this.description,
    required this.icon,
    required this.status,
    this.isChecked = false,
  });

  ///
  /// Sobrescreve o método [props] da classe Equatable para definir quais são as propriedades
  /// que serão usadas para comparar dois objeto
  ///
  @override
  List<Object> get props => [id, name, description, icon, status!, isChecked!];

  ///
  /// Converte o objeto Benefit para um map<String,dynamic>
  ///
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "description": description,
      "icon": icon,
      "status": status?.toMap(),
      "isChecked": isChecked,
    };
  }

  ///
  /// Converte uma lista de objetos Benefit para uma lista de map<String, dynamic>
  ///
  static List<Map<String, dynamic>> toPdvMapList(List<Benefit> benefits) {
    List<Map<String, dynamic>> list = [];
    for (var element in benefits) {
      list.add({
        "id": element.id,
        "name": element.name,
      });
    }
    return list;
  }

  ///
  /// Converte um Map<String, dynamic> para um objeto Benefit
  ///
  static Benefit fromMap(Map<String, dynamic> map) {
    return Benefit(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      icon: map['icon'],
      status: map['status'] != null ? Status.fromMap(map['status']) : null,
      isChecked: map['isChecked'] ?? false,
    );
  }

  ///
  /// Converte um Map<String, dynamic> para um objeto Benefit
  ///
  static List<Benefit> benefitsToList(Map<String, dynamic> map) {
    return List.from(map['benefits']).map((e) => Benefit.fromMap(e)).toList();
  }

  ///
  /// Converte um Map<String, dynamic> para uma lista de objetos Benefit (sub-benefícios)
  ///
  static List<Benefit> subBenefitToList(Map<String, dynamic> map) {
    return List.from(map['otherBenefits']).map((e) => Benefit.fromMap(e)).toList();
  }
}

///
/// Classe que representa o status de um benefício
///
class Status extends Equatable {
  final bool active;
  String? url;
  OrderStatus? orderStatus;

  Status({
    required this.active,
    required this.url,
    required this.orderStatus,
  });

  ///
  /// Sobrescreve o método [props] da classe [Equatable] para definir quais são as propriedades
  /// que serão usadas para comparar dois objetos
  ///
  @override
  List<Object?> get props => [active, url, orderStatus];

  ///
  /// Converte o objeto Status para um Map<String, dynamic>
  ///
  Map<String, dynamic> toMap() {
    return {
      "active": active,
      "url": url,
      "orderStatus": orderStatus,
    };
  }

  ///
  /// Converte um Map<String, dynamic> para um objeto Status
  ///
  static Status fromMap(Map<String, dynamic> map) {
    return Status(
      active: map['active'],
      url: map['url'] ?? "",
      orderStatus: map['orderStatus'] != null ? OrderStatus.fromMap(map['orderStatus']) : null,
    );
  }
}
