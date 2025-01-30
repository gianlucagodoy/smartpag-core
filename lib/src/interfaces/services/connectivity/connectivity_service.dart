import 'package:smartpag_domain/enums/enums.dart';

import '../../../utils/dependencies/dependecies.dart';

///
///  Classe abstrata que representa um serviço de conectividade.
///  Esta classe define métodos para verificar se há uma conexão com a internet
///  e para obter um fluxo de eventos que notifica as mudanças no status da conectividade.
///
abstract class ConnectivityService {
  Future<bool>? hasConnection();
  Stream<SmartConnectivityStatus>? getConectivityStream();
}
