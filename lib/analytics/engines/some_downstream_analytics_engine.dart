import '../analytics.dart';

final class SomeDownstreamAnalyticsEngine implements IAnalyticsEngine {
  const SomeDownstreamAnalyticsEngine();

  @override
  Future<void> initialize() async {
    // TODO: connect to some downstream analytics service
  }

  @override
  void submit(AnalyticsEvent event) {
    // TODO: capture event with downstream analytics service
  }
}
