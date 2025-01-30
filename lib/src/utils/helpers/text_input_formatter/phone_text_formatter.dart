import 'package:flutter/services.dart';
import '../masks/zuk_mask_text_input_formatters.dart';

///
/// A classe [PhoneMaskTextInputFormatter] é uma classe que estende [TextInputFormatter]
/// e é responsável por formatar o texto de um campo de entrada de texto para um número de telefone.
///
/// O método [formatEditUpdate] é chamado sempre que o texto no campo de entrada é atualizado.
/// Ele recebe o valor antigo e o valor novo do campo de entrada e retorna um novo
/// [TextEditingValue] com o texto formatado.
///
/// Nesse caso, o método remove todos os caracteres não numéricos do texto e verifica o comprimento
/// do texto resultante. Se o comprimento for igual a 11, ele formata o texto como um número
/// de telefone celular usando o  [phoneTextFormatter] da classe [ZukMaskTextInputFormatters]
/// e atualiza a posição do cursor. Se o comprimento for igual a 12,
/// ele formata o texto como um número de telefone fixo usando o [landlinePhoneTextFormatter]
/// da classe [ZukMaskTextInputFormatters] e atualiza a posição do cursor.
/// Caso contrário, ele formata o texto como um número de telefone fixo usando
/// o [landlinePhoneTextFormatter] da classe [ZukMaskTextInputFormatters]
/// e atualiza a posição do cursor.
///
/// O método [_updateCursorPosition] é responsável por calcular a nova posição do cursor
///  com base no texto formatado. Ele calcula o comprimento adicionado ao texto formatado em
///  relação ao texto antigo e adiciona esse valor à posição base do cursor antigo.
///
class PhoneMaskTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    var text = newValue.text;
    text = text.replaceAll(RegExp(r'[^\d]'), '');

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

  TextSelection _updateCursorPosition(
    TextEditingValue oldValue,
    String newText,
  ) {
    final int addedLength = newText.length - oldValue.text.length;
    final int selectionIndex = oldValue.selection.baseOffset + addedLength;
    return TextSelection.collapsed(offset: selectionIndex);
  }
}
