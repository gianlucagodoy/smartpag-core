import 'package:flutter/material.dart';

import '../../../../app_lib_core.dart';

/// A classe abstrata [ZukAnalyticsService] define os métodos que devem ser implementados por uma classe concreta
/// responsável por fornecer serviços de análise para o aplicativo Zuk.
///
/// - O método openAppAnalyticsEventWithDescription() registra um evento de análise quando o aplicativo é aberto,
///  incluindo uma descrição adicional.
///
/// - O método openAppAnalyticsEvent() registra um evento de análise quando o aplicativo é aberto.
///
/// - O método eventRegister() registra um evento de análise com um nome específico e parâmetros opcionais.
///
/// - O método backendError() registra um evento de análise para erros ocorridos no backend, recebendo um mapa com informações sobre o erro.
///
/// - O método saveConfigLogin() salva a configuração de login de um usuário, recebendo o ID como parâmetro.
///
/// Essa classe abstrata serve como uma base para a implementação de serviços de análise específicos
/// para o aplicativo Zuk. Cada método pode ser implementado de acordo com as necessidades do aplicativo
/// e da plataforma de análise utilizada.
abstract class ZukAnalyticsService {
  ZukAnalyticsService();
  final FirebaseAnalytics? analytics = null;

  /// registra um evento de análise quando o aplicativo é aberto, incluindo uma descrição adicional.
  Future<void> openAppAnalyticsEventWithDescription();

  /// registra um evento de análise quando o aplicativo é aberto.
  Future<void> openAppAnalyticsEvent();

  /// registra um evento de análise com um nome específico e parâmetros opcionais.
  Future<void> eventRegister(String eventName,
      {Map<String, dynamic>? parameters});

  /// registra um evento de análise para erros ocorridos no backend, recebendo um mapa com informações sobre o erro.
  Future<void> backendError(Map<String, dynamic> error);

  /// salva a configuração de login de um usuário, recebendo o ID como parâmetro.
  Future<void> saveConfigLogin(int? id);
}
