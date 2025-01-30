import 'package:get_it/get_it.dart';

import 'app_lib_core.dart';

///A variável "I" é uma instância do serviço de injeção de dependência do Smart
late final SmartInjectorServices I;

///A variável "logger" é uma instância do serviço de registro de logs do Smart.
late final SmartLoggerServices logger;

/// {@tool snippet}
///
///A função "initCore" é chamada antes do "runApp()" do aplicativo e é responsável
///por inicializar as variáveis globais. Ela cria uma instância do serviço de injeção de dependência
///e uma instância do serviço de registro de logs.
///Em seguida, a função "init" é chamada no serviço de registro de logs para
///realizar qualquer inicialização necessária.
///
///
/// ```dart
/// Future<void> main()async{
/// await initCore();
/// runApp(App());
/// }
/// ```
///
/// {@end-tool}
Future<void> initCore() async {
  I = SmartInjectorServicesImpl(GetIt.instance);
  logger = SmartLoggerServicesImpl()..init();
}
