import 'package:smartpag_domain/smartpag_domain.dart';

import '../../../models/auth/zuk_auth_message.dart';

///
/// Serviços de autenticação local.
///
/// Esta classe abstrata define os métodos para autenticação local, como autenticação biométrica.
///
abstract class LocalAuthServices {
  ///
  /// Autentica o usuário localmente.
  ///
  /// @param localizedReason O motivo da autenticação, exibido ao usuário.
  ///
  /// @param authMessages As mensagens de autenticação a serem exibidas ao usuário.
  ///
  /// @param options As opções de autenticação.
  ///
  /// @return Um Future que retorna true se a autenticação for bem-sucedida, caso contrário, false.
  ///
  Future<bool> authenticate({
    required String localizedReason,
    required Iterable<SmartAuthMessages> authMessages,
    required SmartAuthenticationOptions options,
  });

  ///
  /// Verifica se o dispositivo suporta a autenticação biométrica.
  ///
  /// @return Um Future que retorna true se o dispositivo suportar a autenticação biométrica, caso contrário, false.
  ///
  Future<bool> canCheckBiometrics();

  ///
  /// Verifica se o dispositivo é suportado para autenticação biométrica.
  ///
  /// @return Um Future que retorna true se o dispositivo for suportado para autenticação biométrica, caso contrário, false.
  ///
  Future<bool> isDeviceSupported();

  ///
  /// Obtém os tipos de autenticação biométrica disponíveis no dispositivo.
  ///
  /// @return Um Future que retorna uma lista de tipos de autenticação biométrica disponíveis.
  ///
  Future<List<SmartBiometricType>> getAvailableBiometrics();
}
