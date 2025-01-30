///
/// A classe abstrata [ZukNfcServices] define um contrato para implementar a funcionalidade
/// de verificação de disponibilidade do [NFC]. Através do método [isAvailable], é possível verificar se
/// o dispositivo suporta a tecnologia [NFC]. Essa classe pode ser utilizada como base para a criação
/// de serviços que utilizem o [NFC] como meio de comunicação.
///
abstract class ZukNfcServices {
  /// verificar se o dispositivo suporta a tecnologia [NFC]
  Future<bool> isAvailable();
}
