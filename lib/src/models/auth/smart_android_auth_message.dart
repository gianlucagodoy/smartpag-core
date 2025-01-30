// ignore: depend_on_referenced_packages
// ignore: depend_on_referenced_packages
import 'package:local_auth_android/local_auth_android.dart';

import '../../../app_lib_core.dart';

/// Classe que implementa as mensagens de autenticação do Smart para Android,
/// estendendo a classe [AndroidAuthMessages] e implementando a interface [SmartAuthMessages].
class SmartAndroidAuthMessages extends AndroidAuthMessages
    implements SmartAuthMessages {
  const SmartAndroidAuthMessages({
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
