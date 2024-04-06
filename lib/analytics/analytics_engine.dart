part of 'analytics.dart';

/// All analytics engines will implement this class.
abstract interface class IAnalyticsEngine {
  /// Called once the engine should be initialized.
  Future<void> initialize();

  /// Called once a new analytics event is captured.
  ///
  /// [event] the event to be processed
  void submit(AnalyticsEvent event);
}
