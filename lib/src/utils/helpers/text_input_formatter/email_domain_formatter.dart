import 'package:flutter/services.dart';

///
/// A classe [EmailDomainMaskInputFormatter] é uma classe que estende a classe [TextInputFormatter] do
/// Flutter. Ela é usada para formatar a entrada de texto em um campo de texto,
/// aplicando uma máscara específica para o domínio de um endereço de email.
///
/// No método [formatEditUpdate] , a função recebe o valor antigo do campo de texto ( oldValue )
/// e o novo valor inserido ( newValue ). Em seguida, é feito o processamento do texto inserido
/// para aplicar a máscara desejada.
///
/// Primeiro, é verificado se o texto contém o caractere '@'. Se sim, o caractere é removido.
/// Em seguida, são removidos todos os caracteres especiais
/// como "\", ",", ";", "(", ")", "[", "]", "{" e "}".
///
/// Depois, é verificado se o texto começa com o caractere '0' ou '_'. Se sim, o primeiro
/// caractere é removido. Também são removidas sequências de dois caracteres '_'.
///
/// Por fim, é verificado se o texto não começa com o caractere '@'. Se não, o caractere '@' é
/// adicionado no início do texto.
///
/// O método retorna um novo  TextEditingValue  com o texto formatado e a seleção
///  de texto no final do campo.
///
class EmailDomainMaskInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String text = newValue.text;

    if (text.contains('@')) {
      text = text.replaceAll('@', '');
    }

    text = text.replaceAllMapped(RegExp(r'[\\",;()\[\]{}]'), (match) => '');

    if (text.startsWith('0') || text.startsWith('_')) {
      text = text.substring(1);
    }

    text = text.replaceAll('__', '_');

    if (!text.startsWith('@')) {
      text = '@$text';
    }

    return TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }
}
