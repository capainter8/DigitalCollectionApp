import 'package:flutter/material.dart';

void main() {
  runApp(DigitalCollectionApp());
}

class DigitalCollectionApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Digital Collection App',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: new Text('Digital Collection App'),
    );
  }
}
