import 'package:flutter/foundation.dart';

import '../../utils/utils.dart';
import 'base_app.dart';
import 'micro_app.dart';

/// A interface [MainApp] é uma abstração para criar um aplicativo completo com seus microaplicativos e recursos.
/// Ela estende a interface [BaseApp] e define os seguintes métodos e propriedades:
///
/// -  microApps : uma lista de microaplicativos da aplicação.
///
/// -  baseRoutes : as rotas base do aplicativo, geralmente usadas para declarar rotas globais como uma
///    rota de erro ou rota de nenhuma conexão com a internet.
///
/// -  registerRoutes() : um método assíncrono responsável por cadastrar as rotas base e as rotas dos microaplicativos.
///
/// -  initAppDependencies() : um método assíncrono responsável por registrar as dependências do aplicativo.
///
/// -  initDependencies() : um método assíncrono que registra todas as dependências,
///    tanto as globais quanto as dos microaplicativos.
///
/// -  registerAppListeners() : um método assíncrono responsável por registrar todos os event listeners,
///    tanto os globais quanto os dos microaplicativos.
///

mixin MainApp implements BaseApp {
  /// A lista de microaplicativos da aplicação
  List<MicroApp> get microApps;

  /// As rotas base do App
  ///
  /// Isso geralmente é usado para declarar rotas globais como
  /// uma rota de erro ou rota de nenhuma conexão com a internet
  Map<String, WidgetBuilderArgs> get baseRoutes;

  /// Método responsável por cadastrar as rotas base e
  /// as rotas dos micro apps
  @protected
  Future<void> registerRoutes() async {
    if (baseRoutes.isNotEmpty) routes.addAll(baseRoutes);
    for (final microapp in microApps) {
      routes.addAll(microapp.routes);
    }
  }

  /// Método responsável por registrar as dependências do app
  ///
  /// Você deve registrar aqui as dependências que são usadas ao longo
  /// toda a aplicação
  Future<void> initAppDependencies();

  /// Método responsável por registrar todas as dependências: as globais
  /// e os microaplicativos
  @protected
  @override
  Future<void> initDependencies() async {
    await initAppDependencies();
    for (final microapp in microApps) {
      await microapp.initDependencies();
    }
  }

  /// Método responsável por registrar todos os event listeners: os globais
  /// e os microaplicativos
  @protected
  Future<void> registerAppListeners() async {
    await registerEventListeners();
    for (final microapp in microApps) {
      await microapp.registerEventListeners();
    }
  }
}
