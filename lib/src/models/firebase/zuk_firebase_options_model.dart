import '../../utils/dependencies/dependecies.dart';

///
/// A classe [ZukFirebaseOptionsModel] é uma implementação concreta da classe abstrata [ZukFirebaseOptions] .
/// Ela possui os mesmos atributos e construtores da classe abstrata, além de adicionar alguns atributos
/// específicos para uso em dispositivos [iOS].
///
/// O construtor [ZukFirebaseOptionsModel.fromFirebaseOptions] permite criar uma instância da classe
/// [ZukFirebaseOptionsModel] a partir de uma instância da classe [FirebaseOptions].
/// Ele recebe como parâmetro um objeto [FirebaseOptions] e atribui os valores dos atributos correspondentes.
///
/// O método [toFirebaseOptions] converte uma instância da classe [ZukFirebaseOptionsModel]
/// em uma instância da classe [FirebaseOptions]. Ele retorna um objeto [FirebaseOptions] com os mesmos
/// valores dos atributos da instância atual.
///
class ZukFirebaseOptionsModel extends ZukFirebaseOptions {
  ZukFirebaseOptionsModel({
    required super.apiKey,
    required super.appId,
    required super.messagingSenderId,
    required super.projectId,
    super.authDomain,
    super.databaseURL,
    super.storageBucket,
    super.measurementId,
    // ios specific
    super.trackingId,
    super.deepLinkURLScheme,
    super.androidClientId,
    super.iosClientId,
    super.iosBundleId,
    super.appGroupId,
  });

  ///
  /// O construtor [ZukFirebaseOptionsModel.fromFirebaseOptions] permite criar uma instância da classe
  /// [ZukFirebaseOptionsModel] a partir de uma instância da classe [FirebaseOptions].
  /// Ele recebe como parâmetro um objeto [FirebaseOptions] e atribui os valores dos atributos correspondentes.
  ///
  factory ZukFirebaseOptionsModel.fromFirebaseOptions(
      FirebaseOptions firebaseOptions) {
    return ZukFirebaseOptionsModel(
      apiKey: firebaseOptions.apiKey,
      appId: firebaseOptions.appId,
      messagingSenderId: firebaseOptions.messagingSenderId,
      projectId: firebaseOptions.projectId,
      authDomain: firebaseOptions.authDomain,
      databaseURL: firebaseOptions.databaseURL,
      storageBucket: firebaseOptions.storageBucket,
      measurementId: firebaseOptions.measurementId,
      trackingId: firebaseOptions.trackingId,
      deepLinkURLScheme: firebaseOptions.deepLinkURLScheme,
      androidClientId: firebaseOptions.androidClientId,
      iosClientId: firebaseOptions.iosClientId,
      iosBundleId: firebaseOptions.iosBundleId,
      appGroupId: firebaseOptions.appGroupId,
    );
  }

  ///
  /// O método [toFirebaseOptions] converte uma instância da classe [ZukFirebaseOptionsModel]
  /// em uma instância da classe [FirebaseOptions]. Ele retorna um objeto [FirebaseOptions] com os mesmos
  /// valores dos atributos da instância atual.
  ///
  FirebaseOptions toFirebaseOptions() {
    return FirebaseOptions(
      apiKey: apiKey,
      appId: appId,
      messagingSenderId: messagingSenderId,
      projectId: projectId,
      authDomain: authDomain,
      databaseURL: databaseURL,
      storageBucket: storageBucket,
      measurementId: measurementId,
      trackingId: trackingId,
      deepLinkURLScheme: deepLinkURLScheme,
      androidClientId: androidClientId,
      iosClientId: iosClientId,
      iosBundleId: iosBundleId,
      appGroupId: appGroupId,
    );
  }
}
