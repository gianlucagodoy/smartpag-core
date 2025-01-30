import 'package:flutter/material.dart';

/// Utilize no lugar da classe [Navigator]
///
/// ex: **ZukNavigator.navigatorState.pushNamed("routeName")**
class ZukNavigator {
  static final navigatorKey = GlobalKey<NavigatorState>();

  static NavigatorState get navigatorState => navigatorKey.currentState!;
}
