part of 'custom_application.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  initialLocation: "/",
  navigatorKey: _rootNavigatorKey,
  debugLogDiagnostics: true,
  observers: [_RouterObserver()],
  routes: <RouteBase>[
    GoRoute(
      name: BootScreen.screenName,
      path: "/",
      builder: (context, state) => const BootScreen(),
    ),
    GoRoute(
      name: FirstScreen.screenName,
      path: "/first",
      builder: (context, state) => const FirstScreen(),
    ),
    GoRoute(
      name: SecondScreen.screenName,
      path: "/second",
      builder: (context, state) => const SecondScreen(),
    ),
    GoRoute(
      name: ThirdScreen.screenName,
      path: "/third",
      builder: (context, state) => const ThirdScreen(),
    ),
  ],
);
