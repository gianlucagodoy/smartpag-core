import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:smartpag_domain/enums/enums.dart';

import '../../interfaces/services/connectivity/connectivity_service.dart';
import '../../utils/utils.dart';

///
/// Implementação do serviço de conectividade.
/// Este serviço utiliza a biblioteca [connectivity_plus] para verificar a conectividade do dispositivo.
///
/// A classe [ConnectivityServiceImpl] implementa a interface [ConnectivityService].
/// Ela recebe uma instância da classe [Connectivity] no construtor para poder utilizar seus métodos.
/// O método [hasConnection] verifica se o dispositivo está conectado à internet.
/// Ele utiliza o método [checkConnectivity] da classe [Connectivity] para obter o resultado da conexão.
///
/// Se o resultado for [mobile], [wifi] ou [ethernet], significa que o dispositivo está conectado e o método retorna true.
/// Caso contrário, retorna false.
/// O método [getConectivityStream] retorna um stream que emite eventos quando a conectividade do dispositivo muda.
/// Ele utiliza o método [onConnectivityChanged] da classe [Connectivity] para obter os eventos de mudança de conectividade.
/// Em seguida, mapeia os resultados para os valores do enum [SmartConnectivityStatus] e retorna o stream resultante.
/// Este serviço é utilizado para verificar a conectividade do dispositivo e permitir que o aplicativo reaja de acordo.
///
class ConnectivityServiceImpl implements ConnectivityService {
  final Connectivity connectivity = Connectivity();

  ConnectivityServiceImpl();

  ///
  /// O método [hasConnection] verifica se o dispositivo está conectado à internet.
  /// Ele utiliza o método [checkConnectivity] da classe [Connectivity] para obter o resultado da conexão.
  ///
  @override
  Future<bool> hasConnection() async {
    if ((await connectivity.checkConnectivity()) == ConnectivityResult.mobile ||
        (await connectivity.checkConnectivity()) == ConnectivityResult.wifi ||
        (await connectivity.checkConnectivity()) ==
            ConnectivityResult.ethernet) {
      return true;
    }
    return false;
  }

  ///
  /// O método [getConectivityStream] retorna um stream que emite eventos quando a conectividade do dispositivo muda.
  /// Ele utiliza o método [onConnectivityChanged] da classe [Connectivity] para obter os eventos de mudança de conectividade.
  /// Em seguida, mapeia os resultados para os valores do enum [SmartConnectivityStatus] e retorna o stream resultante.
  /// Este serviço é utilizado para verificar a conectividade do dispositivo e permitir que o aplicativo reaja de acordo.
  ///
  @override
  Stream<SmartConnectivityStatus> getConectivityStream() =>
      _SmartStreamConnectivity();

  Stream<SmartConnectivityStatus> _SmartStreamConnectivity() {
    final Stream<SmartConnectivityStatus> SmartStream =
        connectivity.onConnectivityChanged.asyncMap<SmartConnectivityStatus>(
      (connecty) async {
        switch (connecty) {
          case ConnectivityResult.bluetooth:
            return SmartConnectivityStatus.bluetooth;
          case ConnectivityResult.wifi:
            return SmartConnectivityStatus.wifi;
          case ConnectivityResult.ethernet:
            return SmartConnectivityStatus.ethernet;
          case ConnectivityResult.mobile:
            return SmartConnectivityStatus.mobile;
          case ConnectivityResult.none:
            return SmartConnectivityStatus.none;
          default:
            return SmartConnectivityStatus.none;
        }
      },
    );
    return SmartStream;
  }
}
