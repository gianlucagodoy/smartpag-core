import 'package:dio/dio.dart';

import '../../../../app_lib_core.dart';
import '../../../interfaces/interfaces.dart';

///
/// Esta Classe é um interceptor de autenticação para a biblioteca [Dio].
/// Ele é responsável por adicionar o token de autenticação aos cabeçalhos das requisições
/// feitas pela aplicação.
///
/// O interceptor é implementado como uma classe chamada [AuthInterceptor]
/// que estende a classe [Interceptor] do [Dio]. A classe [AuthInterceptor] substitui o método
/// [onRequest], que é chamado antes de uma requisição ser enviada,
/// e adiciona o token de autenticação aos cabeçalhos da requisição.
///
/// O token de autenticação é obtido através do serviço [SecureStorageServices],
/// que é uma interface para armazenamento seguro de dados.
/// O método [getToken] do serviço é chamado para obter o token,
/// e se o token não estiver vazio, ele é adicionado ao cabeçalho Authorization da requisição.
///
/// Por fim, o interceptor chama o método [onRequest] da classe pai para continuar o fluxo normal
/// de execução do interceptor.
///
/// Com esse interceptor, todas as requisições feitas pela aplicação terão o token de autenticação
/// adicionado aos cabeçalhos, garantindo que apenas usuários autenticados possam acessar
/// os recursos protegidos pela autenticação.
///
class AuthInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final String token =
        await I.getDependency<SmartSecureStorageServices>().getToken();
    if (token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    return super.onRequest(options, handler);
  }
}
