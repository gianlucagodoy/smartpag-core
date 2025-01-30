import 'package:flutter/services.dart';

///
/// A classe [EmailNameMaskInputFormatter] é uma classe que estende a classe [TextInputFormatter]
/// do pacote [flutter/services]. Ela é usada para formatar a entrada de texto em um campo de edição
/// de texto, especificamente para formatar nomes de e-mail.
///
/// O método "formatEditUpdate" é sobrescrito para realizar a formatação do valor de entrada.
/// Ele recebe um valor antigo e um novo valor de edição de texto e
/// retorna um novo valor com a formatação aplicada.
///
/// Primeiro, o método obtém o texto do novo valor de entrada.
/// Em seguida, são aplicadas substituições usando expressões regulares e
/// strings de substituição para remover caracteres indesejados ou formatar o texto
/// de acordo com as regras desejadas.
///
/// A expressão regular r'[\\",;()\[\]{}]' é usada para remover caracteres especiais
/// como "\"", ",", ";", "(", ")", "[", "]" e "{". A função [replaceAll]
/// é usada para substituir esses caracteres por uma string vazia.
///
/// Em seguida, o caractere "@" é removido usando a função [replaceAll] novamente.
///
/// A expressão regular r'^\.' é usada para remover um ponto "." no início do texto, caso exista.
///
/// A expressão regular r'\s+' é usada para remover espaços em branco, caso existam.
///
/// A string ".." é removida usando a função "replaceAll" para substituí-la por uma string vazia.
///
/// Por fim, é retornado um novo valor de edição de texto com o texto formatado e a seleção de texto
/// ajustada para o final do texto formatado.
///
class EmailNameMaskInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String text = newValue.text;

    text = text.replaceAll(RegExp(r'[\\",;()\[\]{}]'), '');
    text = text.replaceAll('@', '');
    text = text.replaceAll(RegExp(r'^\.'), '');
    text = text.replaceAll(RegExp(r'\s+'), '');
    text = text.replaceAll('..', '');

    return TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }
}
