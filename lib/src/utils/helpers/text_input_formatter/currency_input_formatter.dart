import 'package:flutter/services.dart';

import '../helper.dart';
import '../zuk_text_formatter_helper.dart';

///
/// Essa classe é responsável por formatar a entrada de um valor monetário em um campo de texto.
/// Ela herda da classe [TextInputFormatter] e substitui o método [formatEditUpdate]
/// para realizar a formatação adequada.
///
/// A formatação consiste em remover o símbolo de moeda "R$" e quaisquer caracteres especiais que não
/// sejam letras ou espaços em branco do novo valor inserido.
/// Em seguida, o valor é convertido para um número decimal e dividido por 100 para obter o valor
/// monetário correto.
///
/// Após a formatação, o valor é formatado novamente usando um helper chamado [TextFormatterHelper],
/// que formata o valor monetário com a devida pontuação e separadores de milhar.
/// O resultado final é retornado como um novo valor de edição de texto,
/// juntamente com a seleção do cursor posicionada no final do texto formatado.
///
/// Essa classe pode ser usada em campos de entrada de texto onde é necessário formatar um valor
/// monetário de acordo com as convenções locais.
///
class CurrencyInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final double amount = double.parse(newValue.text
            .replaceAll('R\$ ', '')
            .replaceAll(RegExp(r"[^\s\w]"), '')) /
        100;
    final String formattedAmount =
        SmartTextFormatterHelper.formatCurrency(amount);
    return newValue.copyWith(
        text: formattedAmount,
        selection: TextSelection.collapsed(offset: formattedAmount.length));
  }
}
