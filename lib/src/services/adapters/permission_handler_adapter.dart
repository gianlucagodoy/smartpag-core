import 'package:permission_handler/permission_handler.dart' as _hander;

/// A classe [PermissionHandlerAdapter] é um adaptador,
/// encapsulando uma instância confidencial de [Permission] e [PermissionStatus].
/// O cliente pode utilizar uma nova [classe], passando os tipos de contenções que considera úteis,
/// e a nova [classe] ajustará a entrada aos requisitos do [PermissionHandlerAdapter].

class PermissionHandlerAdapter {
  Future<bool> isPermissionEnabled(_hander.Permission permission) async {
    return await permission.status.isGranted;
  }

  Future<_hander.PermissionStatus> checkPermissionStatus(
      _hander.Permission permission) async {
    return await permission.status;
  }

  Future<_hander.PermissionStatus> requestPermission(
      _hander.Permission permission) async {
    return await permission.request();
  }

  Future<Map<_hander.Permission, _hander.PermissionStatus>> requestPermissions(
    List<_hander.Permission> permissions,
  ) async {
    return await permissions.request();
  }

  Future<bool> openAppSettings() async {
    return await _hander.openAppSettings();
  }
}
