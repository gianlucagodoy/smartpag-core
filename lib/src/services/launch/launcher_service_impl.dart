import '../../interfaces/interfaces.dart';
import '../../utils/dependencies/dependecies.dart';

///
/// A classe [LauncherServiceImpl] é uma implementação da interface [LaunchService].
/// Ela fornece métodos para lançar diferentes tipos de ações no dispositivo.
///
/// -  launchEmail : Este método lança um cliente de e-mail no dispositivo com o
///    endereço de e-mail fornecido. É possível também especificar um assunto e um corpo para o e-mail.
///
/// -  launchFile : Este método lança um arquivo no dispositivo,
///    utilizando o caminho do arquivo como parâmetro.
///
/// -  launchPhoneCall : Este método lança o aplicativo de chamadas telefônicas
///    no dispositivo com o número de telefone fornecido.
///
/// -  launchPhoneSms : Este método lança o aplicativo de mensagens SMS
///    no dispositivo com o número de telefone fornecido.
///
/// Esses métodos utilizam o método [launchUrl] para lançar as ações correspondentes no dispositivo.
///
class LauncherServiceImpl implements LaunchService {
  ///
  /// -  launchEmail : Este método lança um cliente de e-mail no dispositivo com o
  ///    endereço de e-mail fornecido. É possível também especificar um assunto e um corpo para o e-mail.
  ///
  @override
  Future<void> launchEmail(String email, {String? subject, String? body}) async {
    await launchUrl(Uri.parse('mailto:$email?subject=${subject ?? ''}&body=${body ?? ''}'));
  }

  ///
  /// -  launchFile : Este método lança um arquivo no dispositivo,
  ///    utilizando o caminho do arquivo como parâmetro.
  ///
  @override
  Future<void> launchFile(String filePath) async {
    await launchUrl(Uri.parse('file:$filePath'));
  }

  ///
  /// -  launchPhoneCall : Este método lança o aplicativo de chamadas telefônicas
  ///    no dispositivo com o número de telefone fornecido.
  ///
  @override
  Future<void> launchPhoneCall(String number) async {
    await launchUrl(Uri.parse('tel:$number'));
  }

  ///
  /// -  launchPhoneSms : Este método lança o aplicativo de mensagens SMS
  ///    no dispositivo com o número de telefone fornecido.
  ///
  @override
  Future<void> launchPhoneSms(String number) async {
    await launchUrl(Uri.parse('sms:$number'));
  }

  @override
  Future<void> launchLink(String link) async {
    await launchUrl(Uri.parse(link));
  }
}
