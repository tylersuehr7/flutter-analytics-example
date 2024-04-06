import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../analytics.dart';

final class ButtonClickedEvent extends AnalyticsEvent {
  final String screenName;
  final String buttonName;

  const ButtonClickedEvent({
    required this.screenName,
    required this.buttonName,
  }): super("button_clicked");

  ButtonClickedEvent.screen(final BuildContext context, {
    required final String buttonName,
  }): this(
    // screenName: ModalRoute.of(context)?.settings.name ?? "Unknown",
    screenName: GoRouterState.of(context).name ?? "Unknown",
    buttonName: buttonName,
  );

  @override
  Map<String, dynamic> get properties => {
    "screen_name": screenName,
    "button_name": buttonName,
  };

  @override
  String toString() {
    return "Button Clicked ('screenName': '$screenName', 'buttonName': '$buttonName')";
  }
}
