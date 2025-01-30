import 'package:flutter/services.dart';

import '../masks/zuk_mask_text_input_formatters.dart';
import '../zuk_checker_helper.dart';

///
/// A classe [SmartMaskRgRne] é uma classe que estende a classe [TextInputFormatter] do Flutter.
/// Ela é responsável por aplicar uma máscara inteligente para formatar a entrada de texto
/// de um campo de RG ou RNE (Registro Nacional de Estrangeiro).
///
/// Através do método [formatEditUpdate] ,
/// a classe verifica o valor atualizado do campo de texto e retorna um novo [TextEditingValue]
/// com o valor formatado de acordo com a máscara.
///
/// Se o novo valor tiver um comprimento menor ou igual a 9 caracteres,
/// a classe utiliza a classe [SmartMaskTextInputFormatters.rgTextFormatter] para aplicar a máscara
/// de formatação de RG. Caso contrário, a classe utiliza o método [clearGenericMask] da classe
/// [CheckerHelper] para remover qualquer máscara genérica aplicada anteriormente.
///
/// O [TextEditingValue] retornado contém o valor formatado e a seleção do texto,
/// que é definida para o final do valor formatado.
///
class SmartMaskRgRne extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    late final String value;
    if (newValue.text.length <= 9) {
      value =
          SmartMaskTextInputFormatters.rgTextFormatter.maskText(newValue.text);
      return TextEditingValue(
        text: value,
        selection: TextSelection.collapsed(offset: value.length),
      );
    }
    value = SmartCheckerHelper.clearGenericMask(newValue.text);
    return TextEditingValue(
      text: value,
      selection: TextSelection.collapsed(offset: value.length),
    );
  }
}
