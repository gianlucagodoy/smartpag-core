import 'package:zukcore/src/utils/utils.dart';

///
/// A extensão [ClientResponseExt] adiciona duas propriedades à classe [GClientResponse] :  [isSuccess]
/// e [isError] . A propriedade [isSuccess] retorna  true
/// se o código de status da resposta for um código de sucesso,
///
/// de acordo com a classe [HttpHelper]. A propriedade [isError] retorna  true  se o código de status
///  da resposta for um código de erro, de acordo com a classe [HttpHelper].
///
extension ClientResponseExt on ZukClientResponse {
  bool get isSuccess => ZukHttpHelper.isSuccessCode(statusCode);
  bool get isError => ZukHttpHelper.isErrorCode(statusCode);
}

///
/// A extensão [ResponseExt] adiciona um método à classe [Response] :  toClientResponse() .
/// Esse método converte um objeto [Response] em um objeto [GClientResponse], preenchendo os campos
/// data ,  statusCode ,  statusMessage ,  realUri  e  headers  com os valores correspondentes
///  do objeto [Response] .
///
extension ResponseExt on Response {
  ZukClientResponse toClientResponse() {
    return ZukClientResponse(
        data: data,
        statusCode: statusCode!,
        statusMessage: statusMessage ?? '',
        realUri: realUri,
        headers: headers.map);
  }
}
