import 'dart:async';

import 'package:geolocator/geolocator.dart';

/// A classe [GeolocatorAdapter] é um adaptador, encapsulando uma instância confidencial de [Geolocator].
/// O cliente pode utilizar uma nova [classe], passando os tipos de contenções que considera úteis,
/// e a nova [classe] ajustará a entrada aos requisitos do [GeolocatorAdapter].
class GeolocatorAdapter {
  Future<LocationPermission> checkPermission() async {
    return await Geolocator.checkPermission();
  }

  Future<bool> isLocationServiceEnabled() async {
    return Geolocator.isLocationServiceEnabled();
  }

  Future<LocationPermission> requestPermission() async {
    return await Geolocator.requestPermission();
  }

  Future<Position?> getCurrentPosition({
    LocationAccuracy desiredAccuracy = LocationAccuracy.best,
    bool forceAndroidLocationManager = false,
    Duration? timeLimit,
  }) async {
    try {
      return await Geolocator.getCurrentPosition(
          desiredAccuracy: desiredAccuracy,
          forceAndroidLocationManager: forceAndroidLocationManager,
          timeLimit: timeLimit);
    } on TimeoutException {
      return null;
    }
  }

  Stream<Position> getPositionStream(LocationSettings? locationSettings) {
    return Geolocator.getPositionStream(locationSettings: locationSettings);
  }
}
