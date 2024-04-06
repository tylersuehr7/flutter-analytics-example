import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  static final String screenName = (FirstScreen).toString();

  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("First Screen"),
      ),
      body: const Center(
        child: Text("Content")
      ),
    );
  }
}
