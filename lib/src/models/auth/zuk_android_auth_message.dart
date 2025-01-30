// ignore: depend_on_referenced_packages
import 'package:zukcore/src/models/auth/Zuk_auth_message.dart';
// ignore: depend_on_referenced_packages
import 'package:local_auth_android/local_auth_android.dart';

/// Classe que implementa as mensagens de autenticação do Zuk para Android,
/// estendendo a classe [AndroidAuthMessages] e implementando a interface [ZukAuthMessages].
class ZukAndroidAuthMessages extends AndroidAuthMessages
    implements ZukAuthMessages {
  const ZukAndroidAuthMessages({
    super.biometricHint,
    super.biometricNotRecognized,
    super.biometricRequiredTitle,
    super.biometricSuccess,
    super.cancelButton,
    super.deviceCredentialsRequiredTitle,
    super.deviceCredentialsSetupDescription,
    super.goToSettingsButton,
    super.goToSettingsDescription,
    super.signInTitle,
  });
}
