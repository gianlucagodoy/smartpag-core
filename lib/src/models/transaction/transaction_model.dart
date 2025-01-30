// ignore_for_file: must_be_immutable

import 'package:smartpag_domain/enums/enums.dart';

import '../../utils/utils.dart';
import 'transaction_history_model.dart';
import 'transaction_split_model.dart';

class Transaction extends Equatable {
  final SmartTransactionStatus? status;
  final String? brandDesc;
  final String type;

  final String pdv;
  final String input;
  final String nsuPdv;
  final String nsuHost;
  final String? receipt;
  final String cardNumber;
  final String responseCode;
  final String acquirerCode;
  final String transactionCode;
  final String responseMessage;
  final String authorizationCode;
  final String? linkedDocumentNumber;
  final String arqc;
  final String aid;

  List<TransactionHistory>? histories;
  List<TransactionSplit> splits;
  final TransactionSplit? splitOrigin;

  final int id;
  final int brandCode;
  final int merchantId;
  final int installments;
  int? splitStatus;

  DateTime? date;

  final double amount;
  final double fullAmount;
  final double grossAmount;

  final bool isSplitable;
  final bool hasFeesToHolder;
  final bool hasAcquireSmart;
  final bool isTransactionOwner;
  final bool isCustomerFee;

  @override
  List<Object> get props => [];

  Transaction({
    required this.id,
    required this.pdv,
    required this.date,
    required this.type,
    required this.input,
    this.status,
    required this.nsuPdv,
    required this.amount,
    required this.nsuHost,
    this.receipt,
    this.brandDesc,
    required this.brandCode,
    required this.isSplitable,
    required this.cardNumber,
    required this.fullAmount,
    required this.merchantId,
    this.splitStatus,
    required this.grossAmount,
    required this.installments,
    required this.responseCode,
    required this.hasFeesToHolder,
    required this.acquirerCode,
    required this.hasAcquireSmart,
    required this.transactionCode,
    required this.responseMessage,
    required this.isTransactionOwner,
    required this.authorizationCode,
    required this.arqc,
    required this.aid,
    required this.isCustomerFee,
    this.splitOrigin,
    this.linkedDocumentNumber,
    this.histories = const [],
    this.splits = const [],
  });

  bool isMtiCodeValid() {
    if (histories != null && histories!.isEmpty) return false;
    return ["0490", "0450"].contains(histories![histories!.length - 1].mtiCode);
  }

  SmartTransactionType? getTransactionType() {
    switch (type.split(" ")[0]) {
      case "Credit":
      case "Crédito":
        return SmartTransactionType.credit;

      case "Debit":
      case "Débito":
        return SmartTransactionType.debit;
      default:
        return null;
    }
  }

  static Transaction fromMap(Map<String, dynamic> map) {
    SmartTransactionStatus? transactionStatus;

    switch ((map['status'] ?? "").toUpperCase()) {
      case "APROVADA":
        transactionStatus = SmartTransactionStatus.approved;
        break;
      case "CANCELADA":
      case "CANCELADO":
        transactionStatus = SmartTransactionStatus.canceled;
        break;
      case "DESFEITA":
        transactionStatus = SmartTransactionStatus.undone;
        break;
      case "NÃO APROVADA":
        transactionStatus = SmartTransactionStatus.notApproved;
        break;
      case "PENDENTE":
        transactionStatus = SmartTransactionStatus.pending;
        break;
      default:
        transactionStatus = null;
    }

    if (map['brandDesc'] is! String || map['brandDesc'].isEmpty)
      transactionStatus = null;

    String pdv = "";
    String? mapPdv = map['pdv'];
    if (mapPdv != null && mapPdv.length >= 3) {
      pdv = mapPdv.substring(mapPdv.length - 3);
    } else {
      pdv = mapPdv ?? "";
    }

    bool isCustomerFee = false;
    if ((map['type'] ?? "").toUpperCase().contains("TAXA CLIENTE")) {
      isCustomerFee = true;
    }

    Transaction transaction = Transaction(
      id: map['id'] ?? 0,
      pdv: pdv,
      type: map['type'] ?? "",
      input: map['input'] ?? "",
      status: transactionStatus,
      amount: map['amount'] ?? 0.0,
      nsuPdv: map['nsuPdv'] ?? "",
      nsuHost: map['nsuHost'] ?? "",
      receipt: map['receipt'],
      brandCode: map['brandCode'] ?? 0,
      brandDesc: map['brandDesc'] ?? "",
      isSplitable: map['splitable'] ?? false,
      cardNumber: map['cardNumber'] ?? "",
      fullAmount: map['fullAmount'] ?? 0.0,
      merchantId: map['merchantId'] ?? 0,
      grossAmount: map['grossAmount'] ?? 0.0,
      responseCode: map['responseCode'] ?? "",
      acquirerCode: map['acquirerCode'] ?? "",
      hasFeesToHolder: map['feesToHolder'] ?? false,
      installments: map['installments'] ?? 0,
      date: map['date'] != null && map['date'].isNotEmpty
          ? DateTime.parse(map['date'])
          : null,
      hasAcquireSmart: map['acquireSmart'] ?? false,
      responseMessage: map['responseMessage'] ?? "",
      transactionCode: map['transactionCode'] ?? "",
      isTransactionOwner: map['transactionOwner'] ?? false,
      authorizationCode: map['authorizationCode'] ?? "",
      linkedDocumentNumber: map['linkedDocumentNumber'],
      isCustomerFee: isCustomerFee,
      splitOrigin: map['splitOrigin'] != null
          ? TransactionSplit.fromMap(map['splitOrigin'])
          : null,
      arqc: map['arqc'] ?? "",
      aid: map['aid'] ?? "",
    );

    if (map['history'] != null) {
      transaction.histories = [];
      map['history'].forEach((mapHistory) {
        transaction.histories!.add(TransactionHistory.fromMap(mapHistory));
      });
    }

    if (map['splits'] != null) {
      transaction.splits = [];
      map['splits'].forEach((mapSplit) {
        transaction.splits.add(TransactionSplit.fromMap(mapSplit));
      });
    }

    if (transaction.status == SmartTransactionStatus.approved &&
        transaction.isTransactionOwner) {
      // 0 - Divisão pendente
      if (transaction.isSplitable &&
          (transaction.date?.difference(DateTime.now()).inDays.abs() ?? 3) <
              3 &&
          transaction.splits.isEmpty) {
        transaction.splitStatus = 0;
        return transaction;
      }
      // 1 - Dividida
      if (transaction.splits.isNotEmpty) {
        transaction.splitStatus = 1;
        return transaction;
      }
      // 2 - Não dividida
      if (transaction.splits.isEmpty) {
        transaction.splitStatus = 2;
        return transaction;
      }
    }

    transaction.splitStatus = 3;
    return transaction;
  }
}
