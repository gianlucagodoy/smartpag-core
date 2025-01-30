import 'package:smartpag_domain/enums/enums.dart';

import '../../../models/firebase/zuk_firebase_options_model.dart';

///
/// Serviços de flavor do Smart.
///
abstract class SmartFlavorServices {
  ///
  /// Inicializa as informações do pacote.
  ///
  Future<void> initPackageInfo();

  ///
  /// Obtém as URLs base para cada API do Smart.
  ///
  /// Retorna um mapa com o nome da API como chave e a URL base como valor.
  Future<Map<SmartApiName, String>> getUrlBase();

  ///
  /// Obtém o nome do aplicativo.
  ///
  String getAppName();

  ///
  /// Obtém o parceiro do aplicativo.
  ///
  String getPartner();

  ///
  /// Obtém o ambiente do aplicativo.
  ///
  String getEnvironment();

  ///
  /// Obtém a versão do aplicativo.
  ///
  String getAppVersion();

  ///
  /// Obtém a versão nativa do aplicativo.
  ///
  String? getNativeVersion();

  ///
  /// Obtém a configuração do Firebase para o aplicativo.
  ///
  SmartFirebaseOptionsModel? getFirebaseConfig();
}
