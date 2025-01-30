import 'package:equatable/equatable.dart';

class TransactionSplit extends Equatable {
  final int merchantId;
  final int? originId;

  final double amount;

  final DateTime? date;

  final String typeOrigin;
  final String merchantName;
  final String merchantDocument;

  @override
  List<Object> get props => [];

  const TransactionSplit({
    required this.merchantId,
    this.originId,
    required this.amount,
    this.date,
    required this.merchantName,
    required this.merchantDocument,
    required this.typeOrigin,
  });

  static TransactionSplit fromMap(Map<String, dynamic> map) {
    String localTypeOrigin = "";

    switch (map['originId']) {
      case 1:
        localTypeOrigin = "Portal Gestão";
        break;
      case 2:
        localTypeOrigin = "Portal Cliente";
        break;
      case 3:
        localTypeOrigin = "APP Cliente";
        break;
      case 4:
        localTypeOrigin = "Terminal";
        break;
      default:
        localTypeOrigin = "";
        break;
    }

    return TransactionSplit(
      merchantId: map['merchantId'] ?? 0,
      originId: map['originId'] ?? 0,
      amount: map['amount'] ?? 0.0,
      date: map['date'] != null && map['date'].isNotEmpty ? DateTime.parse(map['date']) : null,
      typeOrigin: localTypeOrigin,
      merchantName: map['merchantName'] ?? '',
      merchantDocument: map['merchantDocument'] ?? '',
    );
  }
}
