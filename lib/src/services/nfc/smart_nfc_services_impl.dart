import 'package:nfc_manager/nfc_manager.dart';
import '../../interfaces/interfaces.dart';

///
/// Implementação da classe [SmartNfcServices] que fornece serviços relacionados ao [NFC].
///
class SmartNfcServicesImpl implements SmartNfcServices {
  final NfcManager _nfcManager;
  SmartNfcServicesImpl(this._nfcManager);

  ///
  /// Verifica se o [NFC] está disponível no dispositivo.
  /// Retorna true se o [NFC] estiver disponível, caso contrário, retorna false.
  ///
  @override
  Future<bool> isAvailable() async {
    var result = _nfcManager.isAvailable();
    return result;
  }
}
