import 'package:zukcore/init_core.dart';
import 'package:zukcore/src/core.dart';
import 'package:flutter/foundation.dart';

///
/// A classe [ZukFlavorServicesImpl]  implementa a interface [ZukFlavorServices]
/// e fornece métodos para obter informações relacionadas ao aplicativo, como nome, versão,
///  ambiente, configuração do Firebase, versão nativa e parceiro.
///
/// - O método  getAppName  retorna o nome do aplicativo.
///
/// - O método  getAppVersion  retorna a versão do aplicativo.
///
/// - O método  getEnvironment  verifica o ambiente em que o aplicativo está sendo executado com base no último
///  segmento do nome do pacote. Se o último segmento for [dev], [intg] ou [hml], o método retorna esse valor. Caso contrário, retorna [prod].
///
/// - O método  getFirebaseConfig retorna a configuração do Firebase com base no
///  ambiente e parceiro. Ele verifica o parceiro e o ambiente e retorna a configuração correspondente.
///
/// - O método  getNativeVersion  retorna a versão nativa do dispositivo.
///  Para dispositivos iOS, retorna a versão do sistema operacional. Para dispositivos Android, retorna a versão de lançamento.
///
/// - O método  getPartner  verifica o parceiro com base no nome do pacote.
///   Se o nome do pacote contiver "Zuk", o método retorna "pago".
///   Se o nome do pacote tiver mais de 4 segmentos, retorna o último segmento.
///   Caso contrário, retorna "pago".
///
/// - O método  getUrlBase  retorna o URL base com base no ambiente e parceiro. Ele verifica o parceiro e o ambiente e retorna o URL correspondente.
///
/// - O método  initPackageInfo  inicializa as informações do pacote, como o nome do pacote, versão e informações do dispositivo (iOS ou Android).
///
class ZukFlavorServicesImpl implements ZukFlavorServices {
  late final AndroidDeviceInfo androidDeviceInfo;
  late final IosDeviceInfo iosDeviceInfo;
  final DeviceInfoPlugin deviceInfo;
  final PackageInfo packageInfo;
  ZukFlavorServicesImpl(this.deviceInfo, this.packageInfo);

  ///
  /// O método getAppName retorna o nome do aplicativo.
  ///
  @override
  String getAppName() {
    return packageInfo.appName;
  }

  ///
  /// O método getAppVersion retorna a versão do aplicativo.
  ///
  @override
  String getAppVersion() {
    return packageInfo.version;
  }

  ///
  /// O método getEnvironment verifica o ambiente em que o aplicativo está sendo executado com base
  /// no último segmento do nome do pacote. Se o último segmento for [dev], [intg] ou [hml],
  /// o método retorna esse valor. Caso contrário, retorna [prod].
  ///
  @override
  String getEnvironment() {
    List<String> possibleEnviroments = ["dev", "intg", "hml"];
    String lastName = packageInfo.packageName.split(".").last;
    if (possibleEnviroments.contains(lastName)) return lastName;
    return "prod";
  }

  ///
  /// O método getFirebaseConfig retorna a configuração do Firebase com base no ambiente e parceiro.
  /// Ele verifica o parceiro e o ambiente e retorna a configuração correspondente.
  ///
  @override
  ZukFirebaseOptionsModel? getFirebaseConfig() {
    String enviroment = getEnvironment();
    String partner = getPartner();
    logger.info('getFirebaseConfig: enviroment $enviroment, partner $partner');
    switch (partner) {
      case "pago":
        switch (enviroment) {
          case 'dev':
            return ZukFirebaseOptionsModel.fromFirebaseOptions(
                DefaultFirebaseOptionsDev.currentPlatform);
          case 'intg':
            return ZukFirebaseOptionsModel.fromFirebaseOptions(
                DefaultFirebaseOptionsIntg.currentPlatform);
          case 'hml':
            return ZukFirebaseOptionsModel.fromFirebaseOptions(
                DefaultFirebaseOptionsHml.currentPlatform);
          default:
            return ZukFirebaseOptionsModel.fromFirebaseOptions(
                DefaultFirebaseOptionsDev.currentPlatform);
        }
      case "partner0":
        switch (enviroment) {
          case 'dev':
            return ZukFirebaseOptionsModel.fromFirebaseOptions(
                DefaultFirebaseOptionsPartnerDev.currentPlatform);
          case 'intg':
            return ZukFirebaseOptionsModel.fromFirebaseOptions(
                DefaultFirebaseOptionsPartnerIntg.currentPlatform);
          default:
            return ZukFirebaseOptionsModel.fromFirebaseOptions(
                DefaultFirebaseOptionsPartner.currentPlatform);
        }
      default:
        return ZukFirebaseOptionsModel.fromFirebaseOptions(
            DefaultFirebaseOptionsDev.currentPlatform);
    }
  }

  ///
  /// O método getNativeVersion retorna a versão nativa do dispositivo. Para dispositivos iOS,
  /// retorna a versão do sistema operacional. Para dispositivos Android,
  /// retorna a versão de lançamento.
  ///
  @override
  String? getNativeVersion() {
    if (!kIsWeb && Platform.isIOS) {
      return iosDeviceInfo.systemVersion;
    } else if (Platform.isAndroid) {
      return androidDeviceInfo.version.release;
    } else {
      return null;
    }
  }

  ///
  /// O método getPartner verifica o parceiro com base no nome do pacote.
  /// Se o nome do pacote contiver [Zuk], o método retorna [pago].
  /// Se o nome do pacote tiver mais de 4 segmentos, retorna o último segmento. Caso contrário,
  /// retorna [pago].
  ///
  @override
  String getPartner() {
    List<String> names = packageInfo.packageName
        .replaceAll(".dev", "")
        .replaceAll(".intg", "")
        .replaceAll(".hml", "")
        .split(".");
    if (names.contains('Zuk')) return 'pago';
    if (names.length > 4) return names.last;
    return "pago";
  }

  ///
  /// O método getUrlBase retorna o URL base com base no ambiente e parceiro.
  /// Ele verifica o parceiro e o ambiente e retorna o URL correspondente.
  ///
  @override
  Future<Map<ZukApiName, String>> getUrlBase() async {
    //await initPackageInfo();
    String enviroment = getEnvironment();
    String partner = getPartner();

    Map<String, Map<ZukApiName, String>> maps = {};
    switch (partner) {
      case "pago":
        maps = UrlsApiRoutes.Zuk;
        break;
      case "partner0":
        maps = UrlsApiRoutes.partner0;
        break;
    }

    switch (enviroment) {
      case "dev":
        return maps["dev"]!;
      case "intg":
        return maps["intg"]!;
      case "hml":
        return maps["hml"]!;
    }
    return maps["prod"]!;
  }

  ///
  /// O método initPackageInfo inicializa as informações do pacote,
  /// como o nome do pacote, versão e informações do dispositivo (iOS ou Android).
  ///
  @override
  Future<void> initPackageInfo() async {
    if (Platform.isIOS) {
      iosDeviceInfo = await deviceInfo.iosInfo;
    } else if (Platform.isAndroid) {
      androidDeviceInfo = await deviceInfo.androidInfo;
    }
  }
}
