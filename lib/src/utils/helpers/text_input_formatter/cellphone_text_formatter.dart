import 'package:flutter/services.dart';

import '../helper.dart';

///
/// A classe [CellphoneMaskTextInputFormatter] é uma classe que herda de [TextInputFormatter]
/// e é usada para formatar a entrada de texto em um campo de texto para um número de telefone celular.
///
/// O método [formatEditUpdate] é chamado sempre que o valor do campo de texto é atualizado.
/// Ele recebe o valor antigo e o novo valor do campo de texto e retorna o valor atualizado
/// com a formatação aplicada.
///
/// Neste caso, o método remove todos os caracteres não numéricos do novo valor do campo de texto,
/// substitui o terceiro dígito por um "9" se o número tiver mais de 2 dígitos e formata
/// o número de telefone celular com a máscara apropriada se tiver 11 dígitos,
/// ou formata o número de telefone fixo com a máscara apropriada se tiver 12 dígitos.
///
/// O método  [_updateCursorPosition] é usado para atualizar a posição do cursor no campo de texto.
/// Ele calcula a nova posição do cursor com base no comprimento do texto adicionado e
/// retorna a nova posição do cursor como um objeto  TextSelection .
///
class CellphoneMaskTextInputFormatter extends TextInputFormatter {
  ///
  /// O método [formatEditUpdate] é chamado sempre que o valor do campo de texto é atualizado.
  /// Ele recebe o valor antigo e o novo valor do campo de texto e retorna o valor atualizado com a
  /// formatação aplicada.
  ///
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    var text = newValue.text;
    text = text.replaceAll(RegExp(r'[^\d]'), '');

    if (text.length > 2) {
      text = text.replaceRange(2, 3, '9');
    }

    if (text.length == 11) {
      return TextEditingValue(
        text: ZukMaskTextInputFormatters.phoneTextFormatter.maskText(text),
        selection: _updateCursorPosition(newValue,
            ZukMaskTextInputFormatters.phoneTextFormatter.maskText(text)),
      );
    } else if (text.length == 12) {
      return TextEditingValue(
        text: ZukMaskTextInputFormatters.phoneTextFormatter.maskText(text),
        selection: _updateCursorPosition(
            oldValue,
            ZukMaskTextInputFormatters.phoneTextFormatter
                .maskText(oldValue.text.replaceAll(RegExp(r'[^\d]'), ''))),
      );
    } else {
      return TextEditingValue(
        text: ZukMaskTextInputFormatters.landlinePhoneTextFormatter
            .maskText(text),
        selection: _updateCursorPosition(
            newValue,
            ZukMaskTextInputFormatters.landlinePhoneTextFormatter
                .maskText(text)),
      );
    }
  }

  ///
  /// O método [_updateCursorPosition] é usado para atualizar a posição do cursor no campo de texto.
  /// Ele calcula a nova posição do cursor com base no comprimento do texto adicionado e retorna a nova
  /// posição do cursor como um objeto [TextSelection].
  ///
  TextSelection _updateCursorPosition(
    TextEditingValue oldValue,
    String newText,
  ) {
    final int addedLength = newText.length - oldValue.text.length;
    final int selectionIndex = oldValue.selection.baseOffset + addedLength;
    return TextSelection.collapsed(offset: selectionIndex);
  }
}
