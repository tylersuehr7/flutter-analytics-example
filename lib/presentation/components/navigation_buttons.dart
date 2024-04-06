import 'package:analytics_flutter_example/analytics/analytics.dart';
import 'package:analytics_flutter_example/analytics/events/button_clicked_event.dart';
import 'package:analytics_flutter_example/presentation/screens/first_screen/first_screen.dart';
import 'package:analytics_flutter_example/presentation/screens/second_screen/second_screen.dart';
import 'package:analytics_flutter_example/presentation/screens/third_screen/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavigationButtons extends StatelessWidget {
  const NavigationButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: [
        FilledButton(onPressed: () {
          Analytics.capture(ButtonClickedEvent.screen(context, buttonName: "goto-one-button"));
          context.pushNamed(FirstScreen.screenName);
        }, child: const Text("Goto One")),
        FilledButton(onPressed: () {
          Analytics.capture(ButtonClickedEvent.screen(context, buttonName: "goto-two-button"));
          context.pushNamed(SecondScreen.screenName);
        }, child: const Text("Goto Two")),
        FilledButton(onPressed: () {
          Analytics.capture(ButtonClickedEvent.screen(context, buttonName: "goto-three-button"));
          context.pushNamed(ThirdScreen.screenName);
        }, child: const Text("Goto Three")),
      ],
    );
  }
}
