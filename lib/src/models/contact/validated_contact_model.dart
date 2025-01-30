// ignore_for_file: must_be_immutable
import 'dart:convert';
import 'package:equatable/equatable.dart';

///
/// A classe [ValidatedContact] é uma classe de dados que representa um contato validado.
/// Ela herda da classe [Equatable] do pacote "equatable", que permite comparar objetos com base em suas propriedades.
///
/// A classe possui três propriedades opcionais: [document], que representa o documento do contato;
/// [contact], que representa o contato em si; e [type], que representa o tipo de contato.
///
/// O construtor da classe permite definir os valores dessas propriedades.
/// A classe também possui os métodos [fromMap] e [toMap] para converter objetos em mapas e vice-versa.
/// Além disso, possui os métodos [toJson] e [fromJson] para converter objetos em formato JSON e vice-versa.
///
/// A classe também implementa o método [props] da classe [Equatable],
/// que retorna uma lista com as propriedades do objeto.
/// Isso permite comparar objetos da classe com base nessas propriedades.
///
class ValidatedContact extends Equatable {
  String? document;
  String? contact;
  String? type;

  ValidatedContact({
    this.document,
    this.contact,
    this.type,
  });

  ///
  /// implementação do método [props] da classe [Equatable], que retorna uma lista com as propriedades do objeto.
  ///
  @override
  List<Object?> get props => [document, contact, type];

  ///
  /// Metodo que retorna um objeto [ValidatedContact] atraves de um Map<String, dynamic>
  ///
  /// @param map do tipo Map<String, dynamic> representação JSON do objeto [ValidatedContact]
  ///
  static ValidatedContact fromMap(Map<String, dynamic> map) {
    return ValidatedContact(
      document: map["document"],
      contact: map["contact"],
      type: map["type"],
    );
  }

  ///
  /// Metodo que retorna um Map<String, dynamic> de um objeto [ValidatedContact] já instanciado
  ///
  Map<String, dynamic> toMap() {
    return {
      "document": document,
      "contact": contact,
      "type": type,
    };
  }

  ///
  /// Metodo que retorna uma String de Json encoded.
  ///
  String toJson() => json.encode(toMap());

  ///
  /// Metodo estatico que retorna um objeto [ValidatedContact] atraves de uma [String] de [JSON]
  ///
  static ValidatedContact fromJson(String source) => fromMap(json.decode(source));
}
