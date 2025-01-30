// ignore_for_file: must_be_immutable

import '../../utils/utils.dart';
import 'transaction_filter_model.dart';
import 'transaction_model.dart';

class Transactions extends Equatable {
  List<Transaction> transactions;
  Map<ZukTransactionStatus, int> transactionCountByStatus = {
    ZukTransactionStatus.approved: 0,
    ZukTransactionStatus.notApproved: 0,
    ZukTransactionStatus.canceled: 0,
    ZukTransactionStatus.pending: 0,
    ZukTransactionStatus.undone: 0
  };

  @override
  List<Object> get props => [];

  Transactions({required this.transactions});

  static Transactions fromMap(List<Map<String, dynamic>> mapList) {
    var transactions = mapList.map((e) => Transaction.fromMap(e)).toList();
    return Transactions(transactions: transactions);
  }

  List<Transaction> filterTransactions(TransactionFilter filter) {
    var refTransactions = transactions;
    var cashedTransactions = transactions;

    if (filter.status.isNotEmpty) {
      cashedTransactions = refTransactions.fold<List<Transaction>>(
          <Transaction>[], (previousValue, transaction) {
        if (transaction.status != null &&
            filter.status.contains(transaction.status!)) {
          previousValue.add(transaction);
        }
        return previousValue;
      });
      refTransactions = cashedTransactions;
    }

    if (filter.brandDesc.isNotEmpty) {
      cashedTransactions = refTransactions.fold<List<Transaction>>(
          <Transaction>[], (previousValue, transaction) {
        if (filter.brandDesc.contains(transaction.brandDesc)) {
          previousValue.add(transaction);
        }
        return previousValue;
      });
      refTransactions = cashedTransactions;
    }

    if (filter.type.isNotEmpty) {
      cashedTransactions = refTransactions.fold<List<Transaction>>(
          <Transaction>[], (previousValue, transaction) {
        if (filter.type.contains(transaction.getTransactionType())) {
          previousValue.add(transaction);
        }
        return previousValue;
      });
      refTransactions = cashedTransactions;
    }

    if (filter.pdvs.isNotEmpty) {
      cashedTransactions = refTransactions.fold<List<Transaction>>(
          <Transaction>[], (previousValue, transaction) {
        if (filter.pdvs.contains(transaction.pdv) ||
            filter.pdvs.contains(transaction.input)) {
          previousValue.add(transaction);
        }
        return previousValue;
      });
      refTransactions = cashedTransactions;
    }

    if (filter.getPendingTransactions) {
      cashedTransactions = refTransactions.fold<List<Transaction>>(
          <Transaction>[], (previousValue, transaction) {
        if (transaction.isSplitable && transaction.isTransactionOwner) {
          previousValue.add(transaction);
        }
        return previousValue;
      });
      refTransactions = cashedTransactions;
    }

    return refTransactions;
  }

  double getTotalAmount(TransactionFilter filter) {
    return filterTransactions(filter)
        .fold<double>(0, (sum, t) => t.amount + sum);
  }

  void countAndSaveByStatus() {
    for (var key in transactionCountByStatus.keys) {
      transactionCountByStatus[key] =
          filterTransactions(TransactionFilter(status: [key])).length;
    }
  }
}
