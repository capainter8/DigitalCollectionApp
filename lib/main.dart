import 'package:DigitalCollectionApp/loginScreens/loginScreen.dart';
import 'package:DigitalCollectionApp/screens/collection_management/CollectionManagementScreen.dart';
import 'package:DigitalCollectionApp/services/Auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return MultiProvider(
     providers: [
       Provider<Auth>(
         create: (_)=> Auth(FirebaseAuth.instance)),
       

       StreamProvider(create: (context) => context.read<Auth>().authStateChanges)

     ],
    
    child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AuthentificationWrapper(),
   ));
  }
}

class AuthentificationWrapper extends StatelessWidget {
  const AuthentificationWrapper({
    Key key,
  }): super(key: key);

  @override Widget build(BuildContext context)
  {
    final firebaseUser = context.watch<User>();

    if(firebaseUser != null )
  {
     return CollectionManagementScreen();
  }
    return loginScreen();

  }
}
