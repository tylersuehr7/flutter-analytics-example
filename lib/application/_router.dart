part of 'custom_application.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  initialLocation: "/",
  navigatorKey: _rootNavigatorKey,
  debugLogDiagnostics: true,
  routes: <RouteBase>[
    GoRoute(
      name: FirstScreen.screenName,
      path: "/",
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
