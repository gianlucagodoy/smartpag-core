import 'package:equatable/equatable.dart';

class TransactionHistory extends Equatable {
  final int id;
  final DateTime? date;
  final String mtiCode;
  final String mtiDesc;
  final String nsuPdv;
  final String nsuHost;

  @override
  List<Object> get props => [];

  const TransactionHistory({
    required this.id,
    required this.date,
    required this.mtiCode,
    required this.mtiDesc,
    required this.nsuPdv,
    required this.nsuHost,
  });

  static TransactionHistory fromMap(Map<String, dynamic> map) {
    return TransactionHistory(
      id: map['id'] ?? 0,
      nsuPdv: map['nsuPdv'] ?? '',
      mtiCode: map['mtiCode'] ?? '',
      mtiDesc: map['mtiDesc'] ?? '',
      nsuHost: map['nsuHost'] ?? '',
      date: map['date'] != null && map['date'].isNotEmpty ? DateTime.parse(map['date']) : null,
    );
  }
}
