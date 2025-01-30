import 'package:zukcore/src/core.dart';

///
/// O código acima implementa a interface [ZukDynamicLinksServices] usando o Firebase Dynamic Links.
/// Ele inicializa o serviço de link dinâmico e aguarda a chegada de links dinâmicos.
/// Uma vez que um link dinâmico é recebido, ele extrai o caminho e navega para a tela
/// correspondente usando o [ZukNavigator]
///
class ZukDynamicLinksServicesImpl implements ZukDynamicLinksServices {
  final FirebaseDynamicLinks dynamicLinks;
  ZukDynamicLinksServicesImpl(this.dynamicLinks);

  ///
  /// Metodo responsavel pela inicialização do ouvinte dos links dynamicos
  ///
  @override
  Future<void> initDynamicLinks() async {
    dynamicLinks.onLink.listen((dynamicLinkData) {
      ZukNavigator.navigatorState.pushNamed(dynamicLinkData.link.path);
    }).onError((error) {});
  }
}
