import 'package:flutter/material.dart';

class MyNewRoute extends StatelessWidget {
  const MyNewRoute({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as String;
    debugPrint('arguments: $arguments');
    return Scaffold(
        appBar: AppBar(
          title: const Text('New Route'),
        ),
        body: Center(
          child: Text('This is a new route: $arguments'),
        ));
  }
}