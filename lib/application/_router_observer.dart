part of 'custom_application.dart';

final class _RouterObserver extends NavigatorObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    final String routeName = route.settings.name ?? "Unknown";
    Analytics.capture(ScreenViewedEvent(screenName: routeName));
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    final String routeName = newRoute?.settings.name ?? "Unknown";
    Analytics.capture(ScreenViewedEvent(screenName: routeName));
  }
}
