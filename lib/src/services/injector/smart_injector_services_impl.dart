import 'package:get_it/get_it.dart';

import '../../interfaces/interfaces.dart';

///
/// A classe [SmartInjectorServicesImpl] é uma implementação da interface [SmartInjectorServices] .
/// Ela utiliza o pacote [get_it] para realizar a injeção de dependências.
///
/// O método [getDependency] retorna uma instância de uma dependência registrada no [GetIt].
///
/// O método [registerDependency] registra uma dependência no [GetIt] como um singleton,
/// ou seja, a mesma instância será retornada sempre que solicitada.
///
/// O método [registerDependencyFactory] registra uma dependência no [GetIt] como uma factory,
/// ou seja, uma nova instância será criada sempre que solicitada.
///
/// O método [registerDependencyLazySingleton] registra uma dependência no [GetIt]
/// como um lazy singleton, ou seja, a instância será criada apenas quando for solicitada pela primeira vez
/// e será reutilizada nas próximas solicitações.
///
class SmartInjectorServicesImpl implements SmartInjectorServices {
  final GetIt _getIt;
  SmartInjectorServicesImpl(this._getIt);

  ///
  /// O método [getDependency] retorna uma instância de uma dependência registrada no [GetIt].
  ///
  @override
  T getDependency<T extends Object>() {
    return _getIt.get<T>();
  }

  ///
  /// O método [registerDependency] registra uma dependência no [GetIt] como um singleton,
  /// ou seja, a mesma instância será retornada sempre que solicitada.
  ///
  @override
  Future<void> registerDependency<T extends Object>(T dependency) async {
    if (!_getIt.isRegistered<T>()) {
      _getIt.registerSingleton<T>(dependency);
    }
  }

  ///
  /// O método [registerDependencyFactory] registra uma dependência no [GetIt] como uma factory,
  /// ou seja, uma nova instância será criada sempre que solicitada.
  ///
  @override
  Future<void> registerDependencyFactory<T extends Object>(
    T Function() factoryFunc,
  ) async {
    if (!_getIt.isRegistered<T>()) {
      _getIt.registerFactory<T>(factoryFunc);
    }
  }

  ///
  /// O método [registerDependencyLazySingleton] registra uma dependência no [GetIt]
  /// como um lazy singleton, ou seja, a instância será criada apenas quando for solicitada pela primeira vez
  /// e será reutilizada nas próximas solicitações.
  ///
  @override
  Future<void> registerDependencyLazySingleton<T extends Object>(
      T Function() factoryFunc) async {
    if (!_getIt.isRegistered<T>()) {
      _getIt.registerLazySingleton<T>(factoryFunc);
    }
  }
}
