import 'package:flutter/material.dart';

class BootScreen extends StatelessWidget {
  static final String screenName = (BootScreen).toString();

  const BootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Boot Screen"),
      ),
    );
  }
}
