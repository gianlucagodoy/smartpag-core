// ignore_for_file: constant_identifier_names

import 'package:smartpag_domain/common/common.dart';

import '../dependencies/dependecies.dart';

class SmartCheckerHelper {
  static bool validateEmail(String email) {
    if (email.isNotEmpty &&
        email.indexOf('@') >= 3 &&
        email.contains('@') &&
        email.contains('.') &&
        email.indexOf('.', 3) > 0 &&
        email.length > email.lastIndexOf('.') + 2) {
      return true;
    }

    return false;
  }

  static bool validateCpf(String cpf) {
    if (cpf.isNotEmpty &&
        cpf.length == 11 &&
        int.tryParse(cpf) != null &&
        !SmartBlackList.BLACK_LIST_LENGTH_11.contains(cpf)) {
      int sum = 0;
      int rest;
      for (var i = 1; i <= 9; i += 1) {
        sum += (int.tryParse(cpf.substring(i - 1, i), radix: 10)! * (11 - i));
      }
      rest = (sum * 10) % 11;
      if ((rest == 10) || (rest == 11)) rest = 0;
      if (rest != int.tryParse(cpf.substring(9, 10), radix: 10)) return false;
      sum = 0;
      for (var i = 1; i <= 10; i += 1) {
        sum += int.tryParse(cpf.substring(i - 1, i), radix: 10)! * (12 - i);
      }
      rest = (sum * 10) % 11;
      if ((rest == 10) || (rest == 11)) rest = 0;
      if (rest != int.tryParse(cpf.substring(10, 11), radix: 10)) return false;
      return true;
    }
    return false;
  }

  static bool validateCnpj(String cnpj) {
    if (cnpj.isNotEmpty &&
        cnpj.length == 14 &&
        int.tryParse(cnpj) != null &&
        !SmartBlackList.BLACK_LIST_LENGTH_14.contains(cnpj)) return true;
    return false;
  }

  static bool validatePhone(String phone) {
    if (phone.isNotEmpty &&
        phone.length == 11 &&
        int.tryParse(phone) != null &&
        !SmartBlackList.BLACK_LIST_LENGTH_11.contains(phone) &&
        SmartGlobalConstants.DDD_BRASIL.contains(phone.substring(0, 2)))
      return true;
    return false;
  }

  static String clearGenericMask(String text) {
    return text
        .replaceAll('(', '')
        .replaceAll(')', '')
        .replaceAll('.', '')
        .replaceAll('-', '')
        .replaceAll('/', '')
        .replaceAll(' ', '');
  }

  static String offuscateDocument(String input) {
    String doc = input.replaceAll(RegExp(r"[^\s\w]"), '');
    int len = doc.length;
    String aux = "";
    int index = 0;
    if (len > 11) {
      if (len > 14) {
        doc = doc.substring(0, 14);
        len = 14;
      }
      doc = doc.replaceAll(doc.substring(0, 8), '********');
      while (index < len) {
        if (index == 2 || index == 5) {
          aux += '.';
        } else if (index == 8) {
          aux += '/';
        } else if (index == 12) {
          aux += '-';
        }
        aux += doc.substring(index, ++index);
      }
    } else {
      doc = doc.replaceAll(doc.substring(0, 6), '******');
      while (index < len) {
        if (index == 3 || index == 6) {
          aux += '.';
        } else if (index == 9) {
          aux += '-';
        }
        aux += doc.substring(index, ++index);
      }
    }
    return aux;
  }
}
