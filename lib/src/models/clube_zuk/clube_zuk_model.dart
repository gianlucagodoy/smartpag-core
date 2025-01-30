// ignore_for_file: must_be_immutable
import 'package:equatable/equatable.dart';

import '../models.dart';

class ClubeZuk extends Equatable {
  final bool ZukClub;
  final List<Benefit> benefits;

  const ClubeZuk({
    required this.ZukClub,
    required this.benefits,
  });

  @override
  List<Object> get props => [];

  Map<String, dynamic> toMap() {
    return {
      "ZukClub": ZukClub,
      "benefits": benefits.map((e) => e.toMap()).toList(),
    };
  }

  static ClubeZuk fromMap(Map<String, dynamic> map) {
    return ClubeZuk(
      ZukClub: map['ZukClub'],
      benefits:
          List.from(map['benefits']).map((e) => Benefit.fromMap(e)).toList(),
    );
  }
}
