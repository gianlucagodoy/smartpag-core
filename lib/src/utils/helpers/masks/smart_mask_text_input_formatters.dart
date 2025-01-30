import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../dependencies/dependecies.dart';

///
/// A classe [SmartMaskTextInputFormatters] contém formatters de texto com máscaras para diversos
/// formatos, como telefone, CPF, RG, CNPJ, data e CEP.
/// Esses formatters podem ser utilizados para formatar e validar a entrada de texto em campos
/// de formulários.
///
/// -  phoneTextFormatter : Formata números de telefone no formato  (##) # ####-#### .
///
/// -  landlinePhoneTextFormatter : Formata números de telefone fixo no formato  (##) ####-#### .
///
/// -  cpfTextFormatter : Formata números de CPF no formato  ###.###.###-## .
///
/// -  rgTextFormatter : Formata números de RG no formato  ##.###.###-# .
///
/// -  nameTextFormatter : Formata nomes, permitindo apenas letras e caracteres especiais como apóstrofo, ponto e hífen.
///
/// -  cnpjTextFormatter : Formata números de CNPJ no formato  ##.###.###/####-## .
///
/// -  dateTextFormatter : Formata datas no formato  ##/##/#### .
///
/// -  cepTextFormatter : Formata números de CEP no formato  #####-### .
///
/// Esses formatters podem ser utilizados chamando o método [maskText] passando o texto a ser formatado
/// como parâmetro. Por exemplo,  cpfTextFormatter.maskText("12345678901")
/// retorna "123.456.789/01".
class SmartMaskTextInputFormatters {
  ///
  /// -  phoneTextFormatter : Formata números de telefone no formato  (##) # ####-#### .
  ///
  static final MaskTextInputFormatter phoneTextFormatter =
      MaskTextInputFormatter(
    mask: '(##) # ####-####',
    filter: {"#": RegExp(r'[0-9]')},
  );

  ///
  /// -  landlinePhoneTextFormatter : Formata números de telefone fixo no formato  (##) ####-#### .
  ///
  static final MaskTextInputFormatter landlinePhoneTextFormatter =
      MaskTextInputFormatter(
    mask: '(##) ####-####',
    filter: {"#": RegExp(r'[0-9]')},
  );

  ///
  /// - cpfTextFormatter : Formata números de CPF no formato  ###.###.###-## .
  ///
  static final MaskTextInputFormatter cpfTextFormatter = MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {"#": RegExp(r'[0-9]')},
  );

  ///
  /// -  rgTextFormatter : Formata números de RG no formato  ##.###.###-# .
  ///
  static final MaskTextInputFormatter rgTextFormatter = MaskTextInputFormatter(
    mask: '##.###.###-#',
    filter: {"#": RegExp(r'[0-9]')},
  );

  ///
  /// -  nameTextFormatter : Formata nomes, permitindo apenas letras e caracteres especiais como apóstrofo, ponto e hífen.
  ///
  static final MaskTextInputFormatter nameTextFormatter =
      MaskTextInputFormatter(
    filter: {"#": RegExp(r"^[a-zA-Z]+(([',.-][a-zA-Z ])?[a-zA-Z]*)*$")},
  );

  ///
  /// -  cnpjTextFormatter : Formata números de CNPJ no formato  ##.###.###/####-## .
  ///
  static final MaskTextInputFormatter cnpjTextFormatter =
      MaskTextInputFormatter(
    mask: '##.###.###/####-##',
    filter: {"#": RegExp(r'[0-9]')},
  );

  ///
  /// -  dateTextFormatter : Formata datas no formato  ##/##/#### .
  ///
  static final MaskTextInputFormatter dateTextFormatter =
      MaskTextInputFormatter(
    mask: '##/##/####',
    filter: {"#": RegExp(r'[0-9]')},
  );

  ///
  /// -  cepTextFormatter : Formata números de CEP no formato  #####-### .
  ///
  static final MaskTextInputFormatter cepTextFormatter = MaskTextInputFormatter(
    mask: '#####-###',
    filter: {"#": RegExp(r'[0-9]')},
  );
}
