import 'package:DigitalCollectionApp/screens/collection_creation/CollectionCreationScreen.dart';
import 'package:DigitalCollectionApp/screens/collection_creation/CreateFieldScreen.dart';
import 'package:DigitalCollectionApp/screens/collection_creation/FieldConfigScreen.dart';
import 'package:DigitalCollectionApp/screens/collection_creation/FieldTypeSelectScreen.dart';
import 'package:DigitalCollectionApp/screens/collection_viewing/CollectionViewScreen.dart';
import 'package:DigitalCollectionApp/services/CollectionManager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/CreateCollectionModel.dart';
import 'screens/collection_management/CollectionManagementScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => CreateCollectionModel()),
          ChangeNotifierProvider(create: (context) => CollectionManager.instance)
        ],
        child: MaterialApp(
            title: 'Collection App',
            theme: ThemeData(
              primarySwatch: Colors.lightBlue,
              accentColor: Colors.lightBlueAccent,
            ),
            initialRoute: '/',
            routes: {
              '/': (context) => CollectionManagementScreen(),
              '/create_collection': (context) => CollectionCreationScreen(),
              '/view_collection': (context) =>
                  CollectionViewScreen('some collection'),
              '/create_collection/select_field_type': (context) =>
                  FieldTypeSelectScreen(),
              '/create_collection/create_field': (context) =>
                  CreateFieldScreen(),
              '/create_collection/field_configuration': (context) =>
                  FieldConfigScreen(),
            })
    );
  }
}
