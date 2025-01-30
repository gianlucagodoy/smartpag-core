import 'package:flutter/material.dart';

/// Utilize no lugar da classe [Navigator]
///
/// ex: **SmartNavigator.navigatorState.pushNamed("routeName")**
class SmartNavigator {
  static final navigatorKey = GlobalKey<NavigatorState>();

  static NavigatorState get navigatorState => navigatorKey.currentState!;
}
