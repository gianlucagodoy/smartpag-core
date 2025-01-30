import 'package:equatable/equatable.dart';

/// A classe [BenefitInformation] representa informações sobre os benefícios de um determinado objeto.
/// Ela possui três atributos: [whatIs] (o que é), [advantages] (vantagens) e [howItWorks] (como funciona).
/// Esses atributos são obrigatórios e são passados através do construtor da classe.
///
/// A classe também implementa a classe [Equatable] do pacote "equatable", que permite comparar objetos de forma mais
/// fácil. Ela sobrescreve o método [props] para retornar uma lista com os atributos da classe.
///
/// Além disso, a classe possui dois métodos: [toMap], que converte os atributos em um mapa de chave-valor,
/// e [fromMap], que converte um mapa de chave-valor em uma instância da classe [BenefitInformation].
class BenefitInformation extends Equatable {
  /// o que é.
  final String whatIs;

  /// vantagens.
  final String advantages;

  /// como funciona.
  final String howItWorks;

  const BenefitInformation({
    required this.whatIs,
    required this.advantages,
    required this.howItWorks,
  });

  @override
  List<Object> get props => [whatIs, advantages, howItWorks];

  ///
  /// Retorna um Map<String,dynamic> contendo a representação json da classe [BenefitInformation]
  ///
  Map<String, dynamic> toMap() {
    return {
      'whatIs': whatIs,
      'advantages': advantages,
      'howItWorks': howItWorks,
    };
  }

  ///
  /// Retorna um [BenefitInformation] contendo a representação Map<String,dynamic> da classe.
  ///
  static BenefitInformation fromMap(Map<String, dynamic> map) {
    return BenefitInformation(
      whatIs: map['whatIs'],
      advantages: map['advantages'],
      howItWorks: map['howItWorks'],
    );
  }
}
