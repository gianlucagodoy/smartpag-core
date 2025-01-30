import 'package:nfc_manager/nfc_manager.dart';
import '../../interfaces/interfaces.dart';

///
/// Implementação da classe [ZukNfcServices] que fornece serviços relacionados ao [NFC].
///
class ZukNfcServicesImpl implements ZukNfcServices {
  final NfcManager _nfcManager;
  ZukNfcServicesImpl(this._nfcManager);

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
