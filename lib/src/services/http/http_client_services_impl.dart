import 'package:smartpag_domain/entities/entities.dart';
import 'package:smartpag_domain/enums/enums.dart';
import 'package:smartpag_domain/smartpag_domain.dart';

import '../../../init_core.dart';
import '../../core.dart';

///
/// A classe [HttpClientServicesImpl] implementa a interface [HttpClientServices] e é responsável por fazer as requisições HTTP.
/// Ela recebe um cliente [Dio], um serviço de conectividade e um mapa de URLs no construtor.
///
/// O método request é responsável por fazer a requisição HTTP de acordo com o método especificado.
/// Antes de fazer a requisição, ele verifica se há conexão com a internet.
/// Caso não haja, lança uma exceção informando que não há conexão disponível.
/// Caso haja conexão, ele realiza a requisição e verifica se a resposta foi bem-sucedida.
/// Se a resposta não tiver erros, ela é retornada. Caso contrário,
/// é lançada uma exceção informando que houve uma falha ao consumir a API.
///
/// Os métodos  _get ,  _post ,  _put ,  _patch  e  _delete  são responsáveis por fazer as requisições
/// GET, POST, PUT, PATCH e DELETE, respectivamente.
/// Eles utilizam o cliente Dio para fazer as requisições e retornam a resposta
/// convertida para a classe  SmartClientResponse .
///
/// O método  _tryRequest  é responsável por tentar fazer a requisição várias vezes em caso de falha.
/// Ele realiza a requisição e, caso seja bem-sucedida, retorna a resposta.
/// Caso contrário, lança uma exceção informando que houve um erro ao utilizar o
/// serviço de internet do cliente.
///
/// O método  _getHeaders  retorna os cabeçalhos da requisição.
/// Caso não haja cabeçalhos especificados, retorna um mapa vazio.
///
/// O método  sendLogError  é responsável por enviar um log de erro para o serviço de analytics
/// em caso de falha na requisição. Ele obtém o usuário logado, monta um mapa com as informações
/// relevantes da requisição (URL, cabeçalhos, dados, código de status, mensagem de status)
/// e envia para o serviço de analytics.
///
/// O método getDeviceIp faz uma requisição para obter o endereço IP do dispositivo.
/// Ele utiliza uma API externa para obter o endereço IP e retorna o resultado.
///
class HttpClientServicesImpl implements HttpClientServices {
  HttpClientServicesImpl(this._client,
      {required ConnectivityService connectivityService})
      : _connectivityService = connectivityService;

  final Dio _client;
  final ConnectivityService _connectivityService;

  ///
  /// O método request é responsável por fazer a requisição HTTP de acordo com o método especificado.
  /// Antes de fazer a requisição, ele verifica se há conexão com a internet.
  /// Caso não haja, lança uma exceção informando que não há conexão disponível.
  /// Caso haja conexão, ele realiza a requisição e verifica se a resposta foi bem-sucedida.
  /// Se a resposta não tiver erros, ela é retornada. Caso contrário,
  /// é lançada uma exceção informando que houve uma falha ao consumir a API.
  ///
  /// Os métodos  _get ,  _post ,  _put ,  _patch  e  _delete  são responsáveis por fazer as requisições
  /// GET, POST, PUT, PATCH e DELETE, respectivamente.
  /// Eles utilizam o cliente Dio para fazer as requisições e retornam a resposta
  /// convertida para a classe [SmartClientResponse].
  ///
  @override
  Future<SmartClientResponse> request(
      {required SmartApiName apiName,
      required String endpoint,
      required SmartHttpMethod method,
      Map<String, dynamic>? body,
      Map<String, dynamic>? queryParameters,
      Map<String, String>? headers,
      bool isFormData = false,
      bool useBytes = false,
      bool activatedInterceptor = true}) async {
    try {
      late final SmartClientResponse? response;

      final hasConnection = await _connectivityService.hasConnection() ?? false;

      if (!hasConnection) {
        throw const HttpNoConnectionException('''
              Falha ao estabelecer conexão com a internet \n
              O aplicativo tentou acessar recursos online, mas uma conexão com a internet não estava disponível.\n
              Isso pode ser devido a uma conexão Wi-Fi ou de dados móveis desligada ou fraca no dispositivo.\n
              Certifique-se de que seu dispositivo esteja conectado a uma rede ativa com acesso à internet.
              ''');
      } else {
        switch (method) {
          case SmartHttpMethod.get:
            response = await _get(endpoint,
                headers: headers,
                queryParameters: queryParameters,
                useBytes: useBytes);
            break;
          case SmartHttpMethod.post:
            response = await _post(endpoint,
                body: body,
                headers: headers,
                isFormData: isFormData,
                queryParameters: queryParameters,
                useBytes: useBytes);
            break;
          case SmartHttpMethod.put:
            response = await _put(endpoint,
                body: body,
                headers: headers,
                queryParameters: queryParameters,
                useBytes: useBytes);
            break;
          case SmartHttpMethod.patch:
            response = await _patch(endpoint,
                body: body,
                headers: headers,
                queryParameters: queryParameters,
                useBytes: useBytes);
            break;
          case SmartHttpMethod.delete:
            response = await _delete(endpoint,
                body: body,
                headers: headers,
                queryParameters: queryParameters,
                useBytes: useBytes);
            break;
          default:
            throw const HttpMethodNotAlloAllowedException(
                'METHOD NOT SUPPORTED');
        }

        if (!response!.isError) {
          return response;
        }
        sendLogError(response);
        throw const HttpRequestException('''
        Falha ao consumir a API.\n
        O aplicativo encontrou um erro ao tentar acessar uma API externa.
        ''');
      }
    } on TimeoutException catch (_) {
      logger.info('TIMEOUT! ${_.message}');
      throw HttpTimeOutException(_.message);
    } on SocketException {
      throw const HttpNoConnectionException('Conexão Indiponivel');
    } on DioException catch (e) {
      if (e.message?.contains('SocketException') ?? false) {
        throw const HttpNoConnectionException('Conexão Indiponivel');
      } else {
        throw HttpRequestException(e.message);
      }
    }
  }

  ///
  /// O método  _tryRequest  é responsável por tentar fazer a requisição várias vezes em caso de falha.
  /// Ele realiza a requisição e, caso seja bem-sucedida, retorna a resposta. Caso contrário,
  /// lança uma exceção informando que houve um erro ao utilizar o serviço de internet do cliente.
  ///
  Future<Response?> _tryRequest(
    Future<Response> client,
  ) async {
    Response? resp;
    HTTPSmartException? exception;
    for (var i = 0; i < SmartHttpConstants.DEFAULT_QTD_TRIES; i++) {
      try {
        resp = await client.timeout(SmartHttpConstants.DEFAULT_TIMEOUT_TIME);
        break;
      } catch (e) {
        exception = HttpRequestException(e.toString());
      }
    }
    if (resp != null) {
      return resp;
    }

    throw exception ??
        const HttpRequestException(
            "Erro ao utilizar o serviço de internet do cliente");
  }

  Future<SmartClientResponse?> _post(String url,
      {dynamic body,
      Map<String, String>? headers,
      Map<String, dynamic>? queryParameters,
      bool useBytes = false,
      bool isFormData = false}) async {
    final response = await _tryRequest(_client.post(
      url,
      data: isFormData ? FormData.fromMap(body) : body,
      queryParameters: queryParameters,
      options: Options(
          headers: _getHeaders(headers),
          responseType: useBytes ? ResponseType.bytes : null),
    ));
    return response?.toClientResponse();
  }

  Future<SmartClientResponse?> _get(
    String path, {
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    bool useBytes = false,
  }) async {
    final response = await _tryRequest(_client.get(
      path,
      queryParameters: queryParameters,
      options: Options(
          headers: _getHeaders(headers),
          responseType: useBytes ? ResponseType.bytes : null),
    ));
    return response?.toClientResponse();
  }

  Future<SmartClientResponse?> _delete(
    String url, {
    dynamic body,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    bool useBytes = false,
  }) async {
    final response = await _tryRequest(_client.delete(
      url,
      data: body,
      queryParameters: queryParameters,
      options: Options(
          headers: _getHeaders(headers),
          responseType: useBytes ? ResponseType.bytes : null),
    ));
    return response?.toClientResponse();
  }

  Future<SmartClientResponse?> _put(
    String url, {
    dynamic body,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    bool useBytes = false,
  }) async {
    final response = await _tryRequest(_client.put(
      url,
      data: body,
      queryParameters: queryParameters,
      options: Options(
          headers: _getHeaders(headers),
          responseType: useBytes ? ResponseType.bytes : null),
    ));
    return response?.toClientResponse();
  }

  Future<SmartClientResponse?> _patch(
    String url, {
    dynamic body,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    bool useBytes = false,
  }) async {
    final response = await _tryRequest(_client.patch(
      url,
      data: body,
      queryParameters: queryParameters,
      options: Options(
          headers: _getHeaders(headers),
          responseType: useBytes ? ResponseType.bytes : null),
    ));
    return response?.toClientResponse();
  }

  Map<String, String> _getHeaders(Map<String, String>? headers) {
    return headers ?? {};
  }

  ///
  /// O método sendLogError é responsável por enviar um log de erro para o serviço de analytics
  /// em caso de falha na requisição. Ele obtém o usuário logado, monta um mapa com as informações
  /// relevantes da requisição (URL, cabeçalhos, dados, código de status, mensagem de status)
  /// e envia para o serviço de analytics.
  ///
  static void sendLogError(SmartClientResponse resp) async {
    final user = await I.getDependency<SmartSecureStorageServices>().getUser();
    Map<String, dynamic> error = {
      'id': user.client?.id ?? 0,
      'url': resp.realUri.toString(),
      'headers': resp.headers.toString(),
      'data': resp.data.toString(),
      'statusCode': resp.statusCode.toString(),
      'statusMessage': resp.statusMessage,
    };
    I.getDependency<SmartAnalyticsService>().backendError(error);
  }

  ///
  /// O método getDeviceIp faz uma requisição para obter o endereço IP do dispositivo.
  /// Ele utiliza uma API externa para obter o endereço IP e retorna o resultado.
  ///
  @override
  Future<String?> getDeviceIp() async {
    final response = await _tryRequest(_client.get(
      'https://api.ipify.org/?format=text',
      options: Options(
        headers: _getHeaders(HeaderUtils.headers),
      ),
    ));
    if (response?.statusCode == 200 && response?.data is String) {
      return response?.data;
    }
    return null;
  }
}
