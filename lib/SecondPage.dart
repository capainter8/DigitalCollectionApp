import 'package:flutter/material.dart';
import 'screens/collectionCreate/CollectionCreateScreen.dart';


class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Step 1 | Collection Info',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      
      home:CollectionCreateScreen(), 
    );
  }
}
 