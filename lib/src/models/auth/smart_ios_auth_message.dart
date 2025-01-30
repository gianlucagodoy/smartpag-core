// ignore: depend_on_referenced_packages
import 'package:local_auth_ios/local_auth_ios.dart';

import '../../../app_lib_core.dart';

/// A classe [SmartIOSAuthMessages] é uma subclasse que estende a classe [IOSAuthMessages] e implementa a interface
/// [SmartAuthMessages]. Ela herda todas as propriedades e métodos da classe [IOSAuthMessages]
/// e adiciona a implementação dos métodos da interface [SmartAuthMessages].
///
/// Essa classe é usada para definir as mensagens específicas de autenticação para o sistema operacional iOS
/// no contexto do aplicativo Smart. Ela possui constantes que representam as mensagens exibidas ao usuário
/// durante o processo de autenticação, como mensagens de bloqueio de acesso,
/// botões para ir às configurações do dispositivo, descrições para ir às configurações, botão de cancelamento
/// e título para fallback localizado.
///
/// Essa classe é útil para personalizar as mensagens de autenticação de acordo com os requisitos e especificidades
/// do aplicativo Smart no iOS.
class SmartIOSAuthMessages extends IOSAuthMessages
    implements SmartAuthMessages {
  const SmartIOSAuthMessages({
    super.lockOut,
    super.goToSettingsButton,
    super.goToSettingsDescription,
    super.cancelButton,
    super.localizedFallbackTitle,
  });
}
