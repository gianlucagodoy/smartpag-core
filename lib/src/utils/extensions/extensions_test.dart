import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../utils.dart';

extension WidgetTesterExt on WidgetTester {
  ///
  /// A função [pumpWidgetWithApp] recebe um widget e um tema opcional,
  /// e realiza o [pumpWidget] passando o widget envolvido em um [ScreenUtilInit] e um [MaterialApp] .
  /// O [ScreenUtilInit] configura o tamanho de design e a adaptação mínima de texto,
  /// enquanto o [MaterialApp] configura o tema e o widget como a tela inicial.
  ///
  Future<void> pumpWidgetWithApp(
    Widget widget, {
    ThemeData? theme,
  }) async {
    await pumpWidget(
      _buildScreenUtils(widget, theme),
    );
  }

  ///
  /// A função [pumpWidgetWithNavigation] recebe um widget, um [MockNavigator], um [navigatorObserver]
  /// opcional e um mapa de rotas opcional. Ela realiza o [pumpWidget]  passando o widget envolvido em
  /// um [MockNavigatorProvider], que configura o [MockNavigator] como o navegador e o widget como a tela
  /// inicial. O [navigatorObserver] e as rotas são configurados no [MaterialApp] .
  ///
  Future<void> pumpWidgetWithNavigation(
    Widget widget,
    MockNavigator navigator, {
    NavigatorObserver? navigatorObserver,
    Map<String, WidgetBuilder>? routes,
  }) async {
    await pumpWidget(
      _buildNavigatorProvider(
        navigator,
        widget,
        navigatorObserver: navigatorObserver,
        routes: routes,
      ),
    );
  }

  ///
  /// A função [pumpWidgetWithNavigationAndScreenUtils]  é semelhante à função [pumpWidgetWithNavigation] ,
  /// mas também recebe um [themeData] opcional. Ela realiza o [pumpWidget] passando o widget envolvido
  /// em um [MockNavigatorProvider] , que por sua vez é envolvido em um [ScreenUtilInit] e um
  /// [MaterialApp] . O  [ScreenUtilInit]  configura o tamanho de design e a adaptação mínima de texto,
  ///  enquanto o  [MaterialApp]  configura o tema, o [navigatorObserver]  e as rotas.
  ///
  Future<void> pumpWidgetWithNavigationAndScreenUtils(
    Widget widget,
    MockNavigator navigator,
    ThemeData themeData, {
    NavigatorObserver? navigatorObserver,
    Map<String, WidgetBuilder>? routes,
  }) async {
    await pumpWidget(
      MockNavigatorProvider(
        navigator: navigator,
        child: ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, widget) => Builder(
            builder: (ctx) {
              ScreenUtil.init(ctx);
              return MaterialApp(
                navigatorObservers: [
                  if (navigatorObserver != null) navigatorObserver,
                ],
                //locale: const Locale('en'),
                navigatorKey: SmartNavigator.navigatorKey,
                routes: routes ?? {},
                home: widget,
              );
            },
          ),
        ),
      ),
    );
  }

  ///
  /// A função [pumpWidgetWithArguments]  recebe um widget, um [navigatorObserver] opcional
  /// e um argumento opcional. Ela realiza o [pumpWidget] passando o widget envolvido em um [ScreenUtilInit]
  /// que por sua vez é envolvido em um [MaterialApp]. O [MaterialApp] configura o [navigatorObserver]
  /// e define uma rota gerada dinamicamente com o argumento fornecido.
  ///
  Future<void> pumpWidgetWithArguments(
    Widget widget, {
    NavigatorObserver? navigatorObserver,
    dynamic arguments,
  }) async {
    registerFallbackValue(
      MaterialPageRoute(builder: (c) => const Center()),
    );
    await pumpWidget(
      ScreenUtilInit(
        designSize: const Size(360, 640),
        minTextAdapt: true,
        builder: (context, widget) => MaterialApp(
          navigatorObservers: [
            if (navigatorObserver != null) navigatorObserver,
          ],
          onGenerateRoute: (_) {
            return MaterialPageRoute(
              settings: RouteSettings(arguments: arguments),
              builder: (context) => Scaffold(
                body: widget,
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> pumpWidgetWithLocalization(Widget widget) async {
    await pumpWidget(
      ScreenUtilInit(
        designSize: const Size(360, 640),
        minTextAdapt: true,
        builder: (context, widget) => MaterialApp(
          locale: const Locale('en'),
          home: Scaffold(
            body: widget,
          ),
        ),
      ),
    );
  }
}

MockNavigatorProvider _buildNavigatorProvider(
  MockNavigator navigator,
  Widget widget, {
  NavigatorObserver? navigatorObserver,
  Map<String, WidgetBuilder>? routes,
}) =>
    MockNavigatorProvider(
      navigator: navigator,
      child: MaterialApp(
        navigatorObservers: [
          if (navigatorObserver != null) navigatorObserver,
        ],
        locale: const Locale('en'),
        navigatorKey: SmartNavigator.navigatorKey,
        routes: routes ?? {},
        home: widget,
      ),
    );

ScreenUtilInit _buildScreenUtils(Widget widget, ThemeData? theme) =>
    ScreenUtilInit(
      designSize: const Size(360, 640),
      minTextAdapt: true,
      builder: (context, widget) => MaterialApp(
        theme: theme ?? ThemeData(),
        builder: (context, child) {
          ScreenUtil.init(context);
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaleFactor: 1.0,
            ),
            child: child!,
          );
        },
        home: Scaffold(
          body: widget,
        ),
      ),
    );
