import 'package:zukcore/src/models/auth/Zuk_auth_message.dart';
// ignore: depend_on_referenced_packages
import 'package:local_auth_ios/local_auth_ios.dart';

/// A classe [ZukIOSAuthMessages] é uma subclasse que estende a classe [IOSAuthMessages] e implementa a interface
/// [ZukAuthMessages]. Ela herda todas as propriedades e métodos da classe [IOSAuthMessages]
/// e adiciona a implementação dos métodos da interface [ZukAuthMessages].
///
/// Essa classe é usada para definir as mensagens específicas de autenticação para o sistema operacional iOS
/// no contexto do aplicativo Zuk. Ela possui constantes que representam as mensagens exibidas ao usuário
/// durante o processo de autenticação, como mensagens de bloqueio de acesso,
/// botões para ir às configurações do dispositivo, descrições para ir às configurações, botão de cancelamento
/// e título para fallback localizado.
///
/// Essa classe é útil para personalizar as mensagens de autenticação de acordo com os requisitos e especificidades
/// do aplicativo Zuk no iOS.
class ZukIOSAuthMessages extends IOSAuthMessages implements ZukAuthMessages {
  const ZukIOSAuthMessages({
    super.lockOut,
    super.goToSettingsButton,
    super.goToSettingsDescription,
    super.cancelButton,
    super.localizedFallbackTitle,
  });
}
