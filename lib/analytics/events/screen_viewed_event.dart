import '../analytics.dart';

final class ScreenViewedEvent extends AnalyticsEvent {
  final String screenName;

  const ScreenViewedEvent({
    required this.screenName,
  }): super("screen_viewed");

  @override
  Map<String, dynamic> get properties => {
    "screen_name": screenName,
  };

  @override
  String toString() {
    return "Screen Viewed ('screenName': '$screenName')";
  }
}
