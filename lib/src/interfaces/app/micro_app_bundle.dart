import 'main_app.dart';
import 'micro_app.dart';

/// Classe abstrata utilizada para definir um appbase de embrulho utilizado para executar microapps para
/// desenvolvimento local.
abstract class MicroAppBundle implements MainApp {
  /// Microapp Utilizado para navegação apos logica inicial do bundle.
  static MicroApp? microAppToRedirect;
}
