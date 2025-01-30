import 'package:firebase_analytics/firebase_analytics.dart';
import '../../interfaces/services/analytics/Smart_analytics_service.dart';

///
/// A classe [SmartAnalyticsServiceImpl] é responsável por implementar o serviço de analytics do Smart,
/// utilizando a biblioteca [firebase_analytics]. Ela possui métodos para registrar eventos de erro no backend,
/// registrar eventos personalizados, registrar a abertura do aplicativo e salvar a configuração de login.
///
class SmartAnalyticsServiceImpl implements SmartAnalyticsService {
  SmartAnalyticsServiceImpl() : super();

  ///FirebaseAnalytics.instance
  /// A implementação do método [backendError] registra um evento chamado [backendError]
  /// e recebe um mapa de parâmetros que representa o erro ocorrido no backend.
  /// Esse evento é registrado utilizando o método [logEvent] da biblioteca [firebase_analytics].
  ///
  @override
  Future<void> backendError(Map<String, dynamic> error) async {
    await analytics.logEvent(name: 'backendError', parameters: error);
  }

  ///
  /// O método [eventRegister] registra um evento personalizado com o nome especificado em [eventName]
  /// e recebe um mapa de parâmetros opcionais. Esse evento também é registrado utilizando o método
  /// [logEvent] da biblioteca [firebase_analytics] .
  ///
  @override
  Future<void> eventRegister(String eventName,
      {Map<String, dynamic>? parameters}) async {
    await analytics.logEvent(name: eventName, parameters: parameters);
  }

  ///
  /// O método [openAppAnalyticsEvent] registra um evento de abertura do aplicativo utilizando o método
  /// [logAppOpen] da biblioteca [firebase_analytics].
  ///
  @override
  Future<void> openAppAnalyticsEvent() async {
    await analytics.logAppOpen();
  }

  ///
  /// O método [openAppAnalyticsEventWithDescription] registra um evento personalizado chamado [OpenNewApp]
  /// com um parâmetro adicional chamado [description]. Esse evento é registrado utilizando o método [logEvent]
  /// da biblioteca [firebase_analytics].
  ///
  @override
  Future<void> openAppAnalyticsEventWithDescription() async {
    await analytics.logEvent(
      name: "OpenNewApp",
      parameters: <String, dynamic>{"description": "inicializacao_do_app"},
    );
  }

  ///
  /// O método [saveConfigLogin] salva a configuração de login do usuário utilizando o método
  /// [setUserId] da biblioteca [firebase_analytics].
  ///
  @override
  Future<void> saveConfigLogin(int? id) async {
    await analytics.setUserId(id: id.toString());
  }

  @override
  FirebaseAnalytics get analytics => FirebaseAnalytics.instance;
}
