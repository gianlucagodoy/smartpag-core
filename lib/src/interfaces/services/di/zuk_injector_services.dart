/// A classe abstrata [ZukInjectorServices] define os serviços de injeção de dependência
/// para a biblioteca Zuk. Ela possui os seguintes métodos:
///
/// -  getDependency<T>() : Retorna uma instância da dependência do tipo T.
///    Este método é genérico, permitindo a obtenção de qualquer tipo de dependência.
///
/// -  registerDependency<T>(T dependency) : Registra uma dependência do tipo T. Este método é assíncrono
///    e permite registrar uma instância já existente como dependência.
///
/// -  registerDependencyFactory<T>(T Function() factoryFunc) : Registra uma fábrica de dependências do tipo T.
///    Este método é assíncrono e permite registrar uma função que será chamada sempre que uma instância do tipo T
///    for solicitada.
///
/// -  registerDependencyLazySingleton<T>(T Function() factoryFunc) : Registra uma dependência do tipo T
///    como um singleton preguiçoso. Este método é assíncrono e permite registrar uma função que será
///    chamada apenas na primeira vez que uma instância do tipo T for solicitada,
///    e essa mesma instância será retornada em todas as solicitações subsequentes.
///
/// Esses métodos permitem a configuração e obtenção de dependências de forma flexível
/// e eficiente na biblioteca Zuk.
abstract class ZukInjectorServices {
  /// Retorna uma instância da dependência do tipo T.
  /// Este método é genérico, permitindo a obtenção de qualquer tipo de dependência.
  T getDependency<T extends Object>();

  /// Registra uma dependência do tipo T. Este método é assíncrono
  /// e permite registrar uma instância já existente como dependência.
  Future<void> registerDependency<T extends Object>(T dependency);

  /// Registra uma fábrica de dependências do tipo T.
  /// Este método é assíncrono e permite registrar uma função que será chamada sempre que uma instância do tipo T for solicitada.
  Future<void> registerDependencyFactory<T extends Object>(
    T Function() factoryFunc,
  );

  /// Registra uma dependência do tipo T
  /// como um singleton preguiçoso. Este método é assíncrono e permite registrar uma função que será
  /// chamada apenas na primeira vez que uma instância do tipo T for solicitada,
  /// e essa mesma instância será retornada em todas as solicitações subsequentes.
  Future<void> registerDependencyLazySingleton<T extends Object>(
    T Function() factoryFunc,
  );
}
