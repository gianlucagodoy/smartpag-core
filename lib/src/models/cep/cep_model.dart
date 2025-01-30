import 'package:equatable/equatable.dart';

///
/// [Cep] que herda da classe [Equatable].
/// A classe [Cep] representa um objeto CEP e possui propriedades como [zipCode], [street],
/// [complement], [neighborhood], [city], [state] e [ibgeCode].
///  O código também inclui métodos para converter o objeto Cep de/para um map.
///
class Cep extends Equatable {
  final String? zipCode;
  final String? street;
  final String? complement;
  final String? neighborhood;
  final String? city;
  final String? state;
  final String? ibgeCode;

  const Cep({
    required this.zipCode,
    required this.street,
    required this.complement,
    required this.neighborhood,
    required this.city,
    required this.state,
    required this.ibgeCode,
  });

  @override
  List<Object> get props => [];

  static Cep fromMap(Map<String, dynamic> map) {
    return Cep(
      zipCode: map['zipCode'],
      street: map['street'],
      complement: map['complement'],
      neighborhood: map['neighborhood'],
      city: map['city'],
      state: map['state'],
      ibgeCode: map['ibgeCode'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'zipCode': zipCode,
      'street': street,
      'complement': complement,
      'neighborhood': neighborhood,
      'city': city,
      'state': state,
      'ibgeCode': ibgeCode,
    };
  }
}
