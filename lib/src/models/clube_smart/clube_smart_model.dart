// ignore_for_file: must_be_immutable
import 'package:equatable/equatable.dart';

import '../models.dart';

class ClubeSmart extends Equatable {
  final bool SmartClub;
  final List<Benefit> benefits;

  const ClubeSmart({
    required this.SmartClub,
    required this.benefits,
  });

  @override
  List<Object> get props => [];

  Map<String, dynamic> toMap() {
    return {
      "SmartClub": SmartClub,
      "benefits": benefits.map((e) => e.toMap()).toList(),
    };
  }

  static ClubeSmart fromMap(Map<String, dynamic> map) {
    return ClubeSmart(
      SmartClub: map['SmartClub'],
      benefits:
          List.from(map['benefits']).map((e) => Benefit.fromMap(e)).toList(),
    );
  }
}
