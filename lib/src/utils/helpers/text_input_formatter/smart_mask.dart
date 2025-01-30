import 'package:flutter/services.dart';

import '../Zuk_checker_helper.dart';
import '../masks/zuk_mask_text_input_formatters.dart';

///
/// A classe `SmartMaskCpfCnpj` é uma classe que estende a classe `TextInputFormatter` do Flutter.
/// Ela é responsável por formatar a entrada de texto em um campo de texto para exibir uma
/// máscara de CPF ou CNPJ.
///
/// A classe possui uma propriedade `useOnlyNumbers` que determina se deve ser permitido apenas números
/// na entrada de texto. Por padrão, essa propriedade é definida como `false`.
///
/// O método `formatEditUpdate` é sobrescrito para aplicar a formatação correta no valor de texto atualizado.
/// Ele remove qualquer máscara genérica existente no novo valor de texto e verifica se o valor contém apenas números.
/// Se o valor não contiver apenas números e `useOnlyNumbers` estiver definido como `true`,
/// ele remove todos os caracteres não numéricos do valor de texto e retorna o novo valor formatado.
///
/// Caso contrário, se o valor tiver até 11 caracteres, ele aplica a máscara de CPF no novo valor de texto e retorna o novo valor formatado.
/// Se o valor tiver mais de 11 caracteres, ele aplica a máscara de CNPJ no novo valor de texto e retorna o novo valor formatado.
///
/// Se nenhuma das condições acima for atendida, o método retorna o novo valor sem aplicar nenhuma formatação adicional.
///
class SmartMaskCpfCnpj extends TextInputFormatter {
  bool useOnlyNumbers = false;
  SmartMaskCpfCnpj({this.useOnlyNumbers = false});
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String newString = '';
    String newValueWithoutMask =
        ZukCheckerHelper.clearGenericMask(newValue.text);
    bool isOnlyNumber = int.tryParse(newValueWithoutMask) != null;
    if (!isOnlyNumber) {
      if (useOnlyNumbers) {
        newString = newValue.text.replaceAll(RegExp(r"[^0-9./-]"), '');
        return TextEditingValue(
            text: newString,
            selection: TextSelection.collapsed(offset: newString.length));
      } else {
        return newValue;
      }
    } else if (newValueWithoutMask.length <= 11) {
      newString = ZukMaskTextInputFormatters.cpfTextFormatter
          .maskText(newValueWithoutMask);
      return TextEditingValue(
        text: newString,
        selection: TextSelection.collapsed(offset: newString.length),
      );
    } else if (newValueWithoutMask.length > 11) {
      newString = ZukMaskTextInputFormatters.cnpjTextFormatter
          .maskText(newValueWithoutMask);
      return TextEditingValue(
        text: newString,
        selection: TextSelection.collapsed(offset: newString.length),
      );
    }

    return newValue;
  }
}
