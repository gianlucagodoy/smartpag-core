// ignore_for_file: must_be_immutable

import '../../utils/utils.dart';

class TransactionFilter extends Equatable {
  DateTime endDate = DateTime.now();
  DateTime? startDate;
  List<ZukTransactionStatus> status;
  List<ZukTransactionType> type;
  List<String> brandDesc;
  List<String> pdvs;
  bool getPendingTransactions;

  @override
  List<Object> get props => [];

  TransactionFilter({
    this.startDate,
    this.status = const [],
    this.type = const [],
    this.brandDesc = const [],
    this.pdvs = const [],
    this.getPendingTransactions = false,
  }) {
    endDate = DateTime.now();
  }

  Map<String, String> toMap() {
    return {
      "startDate": startDate!.toIso8601String(),
      "endDate": endDate.toIso8601String(),
    };
  }
}
