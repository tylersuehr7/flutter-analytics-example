import 'engines/some_downstream_analytics_engine.dart';
import 'engines/sqlite_analytics_engine.dart';
import 'engines/stub_analytics_engine.dart';

part 'analytics_engine.dart';
part 'analytics_event.dart';

final class Analytics {
  const Analytics._();

  /// Simple interface for capturing any analytics events.
  ///
  /// [event] the analytics event to be captured
  static void capture(final AnalyticsEvent event) async {
  }

  static IAnalyticsEngine? _engine;

  static Future<IAnalyticsEngine> _getLoadedEngine() async {
    IAnalyticsEngine? engine = _engine;
    if (engine == null) {
      // Note: here you would be able to do runtime checks on the
      // configured application environment. So that for production
      // builds, it could use one type of analytics engine, while for
      // development builds, it could use another type of engine.
      final Map<String, IAnalyticsEngine Function()> schemeToEngines = {
        "development": () => SqliteAnalyticsEngine(),
        "production": () => const SomeDownstreamAnalyticsEngine(),
      };

      const String scheme = String.fromEnvironment("scheme", defaultValue: "development");

      _engine = engine = schemeToEngines[scheme]?.call() ?? const StubAnalyticsEngine();

      await engine.initialize();
    }
    return engine;
  }
}
