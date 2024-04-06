part 'analytics_engine.dart';
part 'analytics_event.dart';

final class Analytics {
  const Analytics._();

  /// Simple interface for capturing any analytics events.
  ///
  /// [event] the analytics event to be captured
  static void capture(final AnalyticsEvent event) async {
  }
}
