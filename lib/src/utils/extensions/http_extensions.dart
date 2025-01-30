import 'package:dio/dio.dart';
import 'package:smartpag_domain/smartpag_domain.dart';

import '../helpers/zuk_http_helper.dart';

///
/// A extensão [ClientResponseExt] adiciona duas propriedades à classe [GClientResponse] :  [isSuccess]
/// e [isError] . A propriedade [isSuccess] retorna  true
/// se o código de status da resposta for um código de sucesso,
///
/// de acordo com a classe [HttpHelper]. A propriedade [isError] retorna  true  se o código de status
///  da resposta for um código de erro, de acordo com a classe [HttpHelper].
///
extension ClientResponseExt on SmartClientResponse {
  bool get isSuccess => SmartHttpHelper.isSuccessCode(statusCode);
  bool get isError => SmartHttpHelper.isErrorCode(statusCode);
}

///
/// A extensão [ResponseExt] adiciona um método à classe [Response] :  toClientResponse() .
/// Esse método converte um objeto [Response] em um objeto [GClientResponse], preenchendo os campos
/// data ,  statusCode ,  statusMessage ,  realUri  e  headers  com os valores correspondentes
///  do objeto [Response] .
///
extension ResponseExt on Response {
  SmartClientResponse toClientResponse() {
    return SmartClientResponse(
        data: data,
        statusCode: statusCode!,
        statusMessage: statusMessage ?? '',
        realUri: realUri,
        headers: headers.map);
  }
}
