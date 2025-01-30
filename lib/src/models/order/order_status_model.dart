import 'package:equatable/equatable.dart';

///
/// A classe [OrderStatus] representa o status de um pedido, contendo listas de detalhes de status para pedidos
/// em análise, cancelados e concluídos, bem como o total de pedidos. Ela estende a classe [Equatable]
/// para facilitar a comparação de objetos.
///
///
/// a classe possue métodos para converter o objeto em um Map<String,dynamic> de chave-valor,
/// que pode ser usado para armazenar ou transmitir os dados. Além disso,
/// possuem métodos estáticos para criar objetos a partir de um Map<String,dynamic>.
///
class OrderStatus extends Equatable {
  final List<StatusDetail>? underReview;
  final List<StatusDetail>? canceled;
  final List<StatusDetail>? completed;
  final int? total;

  const OrderStatus({
    required this.underReview,
    required this.canceled,
    required this.completed,
    required this.total,
  });

  @override
  List<Object?> get props => [underReview, canceled, completed, total];

  Map<String, dynamic> toMap() {
    return {
      "underReview": underReview != null ? underReview!.map((v) => v.toMap()).toList() : [],
      "canceled": canceled != null ? canceled!.map((v) => v.toMap()).toList() : [],
      "completed": completed != null ? completed!.map((v) => v.toMap()).toList() : [],
      "total": total
    };
  }

  static OrderStatus fromMap(Map<String, dynamic> map) {
    var underReview = <StatusDetail>[];
    var canceled = <StatusDetail>[];
    var completed = <StatusDetail>[];

    if (map['underReview'] != null) {
      map['underReview'].forEach((item) {
        underReview.add(StatusDetail.fromMap(item));
      });
    }

    if (map['canceled'] != null) {
      map['canceled'].forEach((item) {
        canceled.add(StatusDetail.fromMap(item));
      });
    }

    if (map['completed'] != null) {
      map['completed'].forEach((item) {
        completed.add(StatusDetail.fromMap(item));
      });
    }

    return OrderStatus(underReview: underReview, canceled: canceled, completed: completed, total: map['total']);
  }
}

///
/// A classe [StatusDetail] representa um detalhe de status, contendo um ID e um endereço.
/// Ela também estende a classe [Equatable].
///
/// A classe possue métodos para converter o objeto em um Map<String,dynamic> de chave-valor,
/// que pode ser usado para armazenar ou transmitir os dados. Além disso,
/// possuem métodos estáticos para criar objetos a partir de um Map<String,dynamic>.
///
class StatusDetail extends Equatable {
  final int? id;
  final String? addrees;

  const StatusDetail({
    required this.id,
    required this.addrees,
  });

  @override
  List<Object?> get props => [id, addrees];

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "addrees": addrees,
    };
  }

  static StatusDetail fromMap(Map<String, dynamic> map) {
    return StatusDetail(
      id: map['id'],
      addrees: map['addrees'],
    );
  }
}
