// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

///
/// Classe que representa uma notificação de usuário.
//  Ela contém informações sobre a disponibilidade da notificação,
//  a mensagem da notificação e se a notificação já foi vista pelo usuário.
//  A classe também possui métodos para converter objetos UserNotification
//  em mapas de chave-valor e vice-versa.
///
class UserNotification extends Equatable {
  final bool available;
  final String message;
  bool seen;

  UserNotification({
    required this.available,
    required this.message,
    this.seen = false,
  });

  @override
  List<Object> get props => [available, message, seen];

  ///
  /// Converte o objeto [UserNotification] em um Map<String, dynamic> de
  ///
  Map<String, dynamic> toMap() {
    return {
      'available': available,
      'message': message,
      'seen': seen,
    };
  }

  ///
  /// Converte um Map<String, dynamic> de chave-valor em um objeto
  ///
  static UserNotification fromMap(Map<String, dynamic> map) {
    UserNotification userNotification = UserNotification(
      available: map['available'] ?? false,
      message: map['message'] ?? '',
      seen: map['seen'] ?? false,
    );

    return userNotification;
  }
}
