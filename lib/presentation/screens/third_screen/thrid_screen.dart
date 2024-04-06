import 'package:flutter/material.dart';

class ThirdScreen extends StatelessWidget {
  static final String screenName = (ThirdScreen).toString();

  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Third Screen"),
      ),
    );
  }
}
