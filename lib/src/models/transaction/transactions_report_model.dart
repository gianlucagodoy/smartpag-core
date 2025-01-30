import 'package:equatable/equatable.dart';

class TransactionsReport extends Equatable {
  final int quantity;
  final double totalAmount;

  const TransactionsReport({
    required this.quantity,
    required this.totalAmount,
  });

  @override
  List<Object?> get props => [quantity, totalAmount];

  static TransactionsReport fromMap(Map<String, dynamic> map) {
    return TransactionsReport(
      quantity: map['transactionQuantity'] ?? 0,
      totalAmount: map['totalAmount'] ?? 0.0,
    );
  }
}
