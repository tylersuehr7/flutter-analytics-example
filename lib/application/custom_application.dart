import 'package:analytics_flutter_example/presentation/screens/boot_screen/boot_screen.dart';
import 'package:analytics_flutter_example/presentation/screens/first_screen/first_screen.dart';
import 'package:analytics_flutter_example/presentation/screens/second_screen/second_screen.dart';
import 'package:analytics_flutter_example/presentation/screens/third_screen/thrid_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part '_router.dart';

final class CustomApplication extends StatelessWidget {
  const CustomApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Analytics Example",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.light,
      routerConfig: router,
      builder: (final BuildContext context, final Widget? child) => child!,
    );
  }

  /// Runs this Flutter application.
  static void run() => runApp(const CustomApplication());
}
