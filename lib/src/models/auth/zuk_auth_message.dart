// ignore: depend_on_referenced_packages
import 'package:local_auth_platform_interface/types/auth_messages.dart';

/// A classe [ZukAuthMessages] é uma classe abstrata que implementa a interface [AuthMessages].
/// Ela possui um construtor constante e um método sobrescrito chamado "get args" que retorna um mapa de strings.
/// Essa classe é destinada a fornecer mensagens específicas da Zuk para autenticação.
/// Como é uma classe abstrata, ela não pode ser instanciada diretamente, mas pode ser estendida por outras classes
/// que desejam implementar as mensagens de autenticação específicas da Zuk.
abstract class ZukAuthMessages implements AuthMessages {
  const ZukAuthMessages();

  /// Retorna todas as mensagens específicas da plataforma como um mapa.
  @override
  Map<String, String> get args;
}
