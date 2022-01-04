import 'package:flutter/material.dart';

void main() => runApp( const CallApp());

class CallApp extends StatelessWidget {
  const CallApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        body: Container(
          child: const Text('Hello World'),
        ),
      ),
    );
  }
}