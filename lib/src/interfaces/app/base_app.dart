import 'package:flutter/material.dart';
import 'package:smartpag_domain/smartpag_domain.dart';

import '../../models/models.dart';
import '../../utils/utils.dart';

/// A classe [BaseApp] é uma classe abstrata que serve como base para a implementação de um aplicativo Flutter.
/// Ela possui métodos e propriedades que podem ser sobrescritos para iniciar dependências,
/// registrar ouvintes de eventos e gerar rotas para as telas do aplicativo.
///
/// As propriedades da classe são:
///
/// -  routes : um mapa que mapeia os caminhos das rotas para os seus respectivos construtores de widgets.
///
/// -  key : a chave única que identifica o widget.
///
/// Os métodos da classe são:
///
/// -  initDependencies() : um método assíncrono que deve ser sobrescrito para registrar as dependências do aplicativo.
/// Aqui é onde você pode configurar serviços, inicializar plugins e fazer outras tarefas de inicialização.
///
/// -  registerEventListeners() : um método assíncrono que deve ser sobrescrito para registrar os ouvintes
/// de eventos desejados. Aqui é onde você pode declarar ações para reagir a eventos específicos,
/// como notificações push, eventos de localização, etc.
///
/// -  generateRoute(RouteSettings settings) : um método que gera a rota para uma determinada configuração.
/// Ele recebe as configurações da rota como parâmetro e retorna um objeto [Route] que representa a tela a ser exibida.
/// Este método é chamado pelo [Navigator] do Flutter quando uma rota é solicitada.
///
/// -  _generateDynamicRoute(Uri calledUri, Arguments args) : um método privado que gera uma rota dinâmica
/// com base no caminho da [URI] chamada.
/// Ele percorre o mapa de rotas e verifica se a [URI] chamada corresponde a algum dos caminhos
/// das rotas registradas. Se houver correspondência, os parâmetros da [URI] são combinados com os parâmetros
/// da configuração da rota e uma rota é gerada.
///
/// Essa classe fornece uma estrutura básica para a implementação de um aplicativo Flutter
/// e pode ser estendida para adicionar funcionalidades específicas.
abstract class BaseApp extends StatelessWidget {
  /// map que mapeia os caminhos das rotas para os seus respectivos construtores de widgets.
  final Map<String, WidgetBuilderArgs> routes = {};

  BaseApp({super.key});

  /// Método assíncrono que deve ser sobrescrito para registrar as dependências do aplicativo.
  /// Aqui é onde você pode configurar serviços, inicializar plugins e fazer outras tarefas de inicialização.
  Future<void> initDependencies();

  /// Método assíncrono que deve ser sobrescrito para registrar os ouvintes
  /// de eventos desejados. Aqui é onde você pode declarar ações para reagir a eventos específicos,
  /// como notificações push, eventos de localização, etc.
  Future<void> registerEventListeners();

  /// Método que gera a rota para uma determinada configuração.
  /// Ele recebe as configurações da rota como parâmetro e retorna um objeto [Route] que representa
  /// a tela a ser exibida. Este método é chamado pelo [Navigator] do Flutter quando uma rota é solicitada.
  Route<dynamic>? generateRoute(RouteSettings settings) {
    final Uri currentUri = Uri.parse(settings.name!);
    final String uriPath = currentUri.path;
    final route = routes[uriPath];
    final Arguments routerArgs = settings.arguments != null
        ? (settings.arguments! as Arguments).uri == null
            ? (settings.arguments! as Arguments).copyWith(uri: currentUri)
            : (settings.arguments! as Arguments)
        : Arguments(uri: currentUri, params: currentUri.queryParameters);
    if (route != null) {
      final path = routerArgs.uri?.toString() ?? uriPath;
      return generateFadeRoute(route, path, routerArgs);
    }
    return _generateDynamicRoute(currentUri, routerArgs);
  }

  /// Método privado que gera uma rota dinâmica com base no caminho da [URI] chamada.
  /// Ele percorre o mapa de rotas e verifica se a [URI] chamada corresponde a algum dos caminhos
  /// das rotas registradas. Se houver correspondência, os parâmetros da [URI] são combinados
  /// com os parâmetros da configuração da rota e uma rota é gerada.

  Route<dynamic>? _generateDynamicRoute(Uri calledUri, Arguments args) {
    late final Route<dynamic>? dynamicRoute;
    routes.forEach(
      (namedRoute, builder) {
        final routingData = parseUrlParams(namedRoute, calledUri);
        if (routingData != null) {
          final Map<String, dynamic> combinedArgs = <String, dynamic>{};
          combinedArgs.addAll(routingData.params);
          combinedArgs.addAll(args.params!);
          dynamicRoute = generateFadeRoute(
            builder,
            Uri(path: calledUri.path, queryParameters: args.params).toString(),
            Arguments(params: combinedArgs, uri: routingData.uri),
          );
          return;
        }
      },
    );
    return dynamicRoute;
  }
}
