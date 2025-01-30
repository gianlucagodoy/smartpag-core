// ignore_for_file: must_be_immutable, prefer_const_literals_to_create_immutables
import 'package:corsac_jwt/corsac_jwt.dart';
import 'package:equatable/equatable.dart';

///
/// A classe [Merchant] representa um comerciante e possui os seguintes atributos:
///
/// -  [id] : um inteiro que representa o ID do comerciante.
///
/// -  [uuid] : uma string que representa o UUID do comerciante.
///
/// -  [document] : uma string que representa o documento do comerciante.
///
/// -  [name] : uma string que representa o nome do comerciante.
///
/// -  [pdvs] : uma lista de strings que representa os PDVs (Pontos de Venda) do comerciante.
///
/// -  [anticipationFee] : uma string que representa a taxa de antecipação do comerciante.
///
/// -  [anticipationTime] : uma string que representa o tempo de antecipação do comerciante.
///
/// -  [feeType] : um inteiro que representa o tipo de taxa do comerciante.
///
/// -  [segmentId] : um inteiro que representa o ID do segmento do comerciante.
///
/// A classe [Merchant] representa um comerciante e possui atributos como ID, UUID, documento, nome, PDVs,
/// taxa de antecipação, tempo de antecipação, tipo de taxa e ID do segmento.
/// Ela implementa a interface [Equatable] para facilitar a comparação de objetos.
/// Os métodos [toMap] e [fromMap] são responsáveis por converter o objeto em um mapa de chave-valor e vice-versa.
/// O método [getInfoToken] decodifica um token e retorna o valor correspondente à chave especificada.
///
class Merchant extends Equatable {
  ///
  /// um inteiro que representa o ID do comerciante.
  ///
  int? id;

  ///
  /// uma string que representa o UUID do comerciante.
  ///
  String? uuid;

  ///
  /// uma string que representa o documento do comerciante.
  ///
  String? document;

  ///
  /// uma string que representa o nome do comerciante.
  ///
  String? name;

  ///
  /// uma lista de strings que representa os PDVs (Pontos de Venda) do comerciante.
  ///
  List<String>? pdvs;

  ///
  /// uma string que representa a taxa de antecipação do comerciante.
  ///
  String? anticipationFee;

  ///
  /// uma string que representa o tempo de antecipação do comerciante.
  ///
  String? anticipationTime;

  ///
  /// um inteiro que representa o tipo de taxa do comerciante.
  ///
  int? feeType;

  ///
  /// um inteiro que representa o ID do segmento do comerciante.
  ///
  int? segmentId;

  Merchant({
    this.id,
    this.uuid,
    this.document,
    this.name,
    this.pdvs,
    this.anticipationFee,
    this.anticipationTime,
    this.feeType,
    this.segmentId,
  });

  @override
  List<Object?> get props => [id, uuid, document, name, pdvs, anticipationFee, anticipationTime, feeType, segmentId];

  ///
  /// O método [toMap] converte o objeto [Merchant] em um mapa de chave-valor,
  /// onde cada atributo é mapeado para sua respectiva chave.
  ///
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'id': id,
      'uuid': uuid,
      'document': document,
      'name': name,
      'pdvs': pdvs,
      'anticipationFee': anticipationFee,
      'anticipationTime': anticipationTime,
      'feeType': feeType,
      'segmentId': segmentId,
    };

    return map;
  }

  ///
  /// O método estático [fromMap] recebe um mapa de chave-valor e um token como parâmetros e
  /// retorna um objeto [Merchant] preenchido com os valores do mapa.
  /// Além disso, ele utiliza o token para obter informações adicionais,
  /// como a taxa de antecipação e o tempo de antecipação.
  ///
  static Merchant fromMap(Map<String, dynamic> map, String token) {
    var merchant = Merchant(
      id: map['id'],
      uuid: map['uuid'],
      document: map['document'],
      name: map['name'],
      segmentId: map['segmentId'],
      feeType: map['feeType'],
      pdvs: [],
      anticipationFee: getInfoToken(token, 'anticipationFee'),
      anticipationTime: getInfoToken(token, 'anticipationTime'),
    );

    if (map['pdvs'] != null) {
      map['pdvs'].forEach((pdv) {
        merchant.pdvs!.add(pdv);
      });
    }

    return merchant;
  }

  ///
  /// O método estático [getInfoToken] recebe um token e uma chave como parâmetros e retorna o valor
  /// correspondente à chave no token. Ele utiliza a biblioteca [corsac_jwt] para decodificar o token e obter o valor
  /// desejado.
  ///
  static String getInfoToken(String token, String key) {
    if (token.isEmpty) return '';
    JWT decodedToken = JWT.parse(token);
    String value = decodedToken.getClaim(key);
    return value;
  }
}
