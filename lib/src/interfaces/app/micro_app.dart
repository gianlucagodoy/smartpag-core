import 'base_app.dart';

/// A interface [MicroApp] é uma abstração para criar um micro app, que é semelhante a um microfrontend.
/// Essa interface define um contrato que as classes devem seguir para implementar um micro app.
///
/// A interface [MicroApp] herda da interface [BaseApp] e, portanto, também inclui os métodos e propriedades
/// definidos nessa interface.
///
/// Além disso, a interface [MicroApp] define um método getter [microAppName] que retorna uma string
/// representando o nome do micro app. Esse método deve ser implementado pelas classes que implementam essa interface.
///
/// Essa interface é útil para garantir que os micro apps sigam um padrão comum e possam ser facilmente
/// integrados em outros sistemas.
mixin MicroApp implements BaseApp {
  String get microAppName;
}
