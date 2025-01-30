import 'package:local_auth/local_auth.dart';
import 'package:smartpag_domain/smartpag_domain.dart';
import '../../core.dart';

///
/// Esta Classe implementa a interface [LocalAuthServices] usando o pacote [local_auth].
///
/// Ele fornece métodos para autenticar o usuário por meio de biometria ou pin/senha.
///
/// Ele também verifica se o dispositivo suporta biometria e lista os tipos de biometria disponíveis.
///
/// As opções de autenticação podem ser passadas pelo parâmetro [SmartAuthenticationOptions].
///
/// Todos os métodos retornam um Future que resolve para um booleano indicando se a autenticação foi bem-sucedida ou não.
///
class LocalAuthServicesImpl implements LocalAuthServices {
  final LocalAuthentication _localAuthentication;
  LocalAuthServicesImpl(this._localAuthentication);

  ///
  /// Método para autenticar usando a biblioteca [LocalAuthentication]
  ///
  /// Parâmetros:
  ///
  /// - localizedReason: uma mensagem localizada para exibir ao usuário durante a autenticação
  ///
  /// - authMessages: uma lista de mensagens de autenticação personalizadas
  ///
  /// - options: opções de autenticação, como uso de diálogos de erro, autenticação persistente, transação sensível e apenas biometria
  /// Retorna:
  ///
  /// - @return Um Future<bool> que indica se a autenticação foi bem-sucedida ou não
  ///
  @override
  Future<bool> authenticate(
      {required String localizedReason,
      required Iterable<SmartAuthMessages> authMessages,
      required SmartAuthenticationOptions options}) async {
    return _localAuthentication.authenticate(
        localizedReason: localizedReason,
        authMessages: authMessages,
        options: AuthenticationOptions(
            useErrorDialogs: options.useErrorDialogs,
            stickyAuth: options.stickyAuth,
            sensitiveTransaction: options.sensitiveTransaction,
            biometricOnly: options.biometricOnly));
  }

  ///
  /// Verifica se o dispositivo suporta a autenticação biométrica.
  ///
  /// @return Um [Future] que retorna um [bool] indicando se o dispositivo suporta a autenticação
  /// biométrica.
  ///
  @override
  Future<bool> canCheckBiometrics() async {
    return _localAuthentication.canCheckBiometrics;
  }

  ///
  /// Obtém uma lista dos tipos de autenticação biométrica disponíveis no dispositivo.
  ///
  /// @return Um [Future] que retorna uma lista de [SmartBiometricType]
  /// indicando os tipos de autenticação biométrica disponíveis.
  ///
  @override
  Future<List<SmartBiometricType>> getAvailableBiometrics() async {
    return (await _localAuthentication.getAvailableBiometrics())
        .map((e) => SmartBiometricType.values[e.index])
        .toList();
  }

  ///
  /// Verifica se o dispositivo é suportado pela autenticação biométrica.
  ///
  /// @return Um [Future] que retorna um [bool] indicando se o dispositivo é suportado pela autenticação biométrica.
  ///
  @override
  Future<bool> isDeviceSupported() async {
    return _localAuthentication.isDeviceSupported();
  }
}
