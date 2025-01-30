import '../../../app_lib_core.dart';
import '../../utils/navigator/zuk_navigator.dart';

///
/// O código acima implementa a interface [SmartDynamicLinksServices] usando o Firebase Dynamic Links.
/// Ele inicializa o serviço de link dinâmico e aguarda a chegada de links dinâmicos.
/// Uma vez que um link dinâmico é recebido, ele extrai o caminho e navega para a tela
/// correspondente usando o [SmartNavigator]
///
class SmartDynamicLinksServicesImpl implements SmartDynamicLinksServices {
  final FirebaseDynamicLinks dynamicLinks;
  SmartDynamicLinksServicesImpl(this.dynamicLinks);

  ///
  /// Metodo responsavel pela inicialização do ouvinte dos links dynamicos
  ///
  @override
  Future<void> initDynamicLinks() async {
    dynamicLinks.onLink.listen((dynamicLinkData) {
      SmartNavigator.navigatorState.pushNamed(dynamicLinkData.link.path);
    }).onError((error) {});
  }
}
