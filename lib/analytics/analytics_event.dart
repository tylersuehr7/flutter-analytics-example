part of 'analytics.dart';

/// All analytics events will inherit this parent class.
abstract class AnalyticsEvent {
  final String eventName;

  /// Constructs will name of the analytics event.
  ///
  /// This event name should be unique per-object and should
  /// be like: "button_clicked", "noun_verb", etc.
  const AnalyticsEvent(this.eventName);

  /// Subclasses will override this and should put all their
  /// custom analytics properties into this variable. This is
  /// payload that will be captured for this event.
  Map<String, dynamic> get properties;
}
