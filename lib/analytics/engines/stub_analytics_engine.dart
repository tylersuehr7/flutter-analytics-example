import '../analytics.dart';

final class StubAnalyticsEngine implements IAnalyticsEngine {
  const StubAnalyticsEngine();

  @override
  Future<void> initialize() async {
  }

  @override
  void submit(AnalyticsEvent event) {
  }
}
