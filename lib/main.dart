import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Get Http API',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Get List Flutter'),
        ),
        body: const Center(
          child: Text('Hello World of FLutter'),
        ),
      ),
    );
  }
}
