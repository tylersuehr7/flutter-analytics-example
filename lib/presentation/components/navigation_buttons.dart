import 'package:analytics_flutter_example/presentation/screens/first_screen/first_screen.dart';
import 'package:analytics_flutter_example/presentation/screens/second_screen/second_screen.dart';
import 'package:analytics_flutter_example/presentation/screens/third_screen/thrid_screen.dart';
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
          context.pushNamed(FirstScreen.screenName);
        }, child: const Text("Goto One")),
        FilledButton(onPressed: () {
          context.pushNamed(SecondScreen.screenName);
        }, child: const Text("Goto Two")),
        FilledButton(onPressed: () {
          context.pushNamed(ThirdScreen.screenName);
        }, child: const Text("Goto Three")),
      ],
    );
  }
}
