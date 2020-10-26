import 'package:DigitalCollectionApp/loginScreens/registerScreen.dart';
import 'package:DigitalCollectionApp/screens/collection_management/CollectionManagementScreen.dart';
import 'package:flutter/material.dart';
import 'package:DigitalCollectionApp/services/Auth.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class loginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _loginScreen();
  }
}

class _loginScreen extends State<loginScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
           appBar: AppBar(
          elevation: 0.0,
          title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Welcome to Digital Collections"),
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: ImageIcon(
                AssetImage('assets/images/icon.png'),
                color: Color(0xAAFFFFFF)
              ),
            )
          ],
        )
      ),
      body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child:ImageIcon(
                AssetImage('assets/images/icon.png'),
                color: Colors.deepOrange,
                size: 150,),),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                FlatButton(
                  onPressed: (){
                    //forgot password screen
                  },
                  textColor: Colors.blue,
                  child: Text('Forgot Password'),
                ),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.black,
                      child: Text('Login' ,style: TextStyle(fontSize: 20)),
                      onPressed: () {
                           context.read<Auth>().login(
                          email:  emailController.text,
                          password: passwordController.text 
                        );
                      },
                    )),
                Container(
                    child: Row(
                      children: <Widget>[
                        Text('New to the app?'),
                        FlatButton(
                          textColor: Colors.black,
                          child: Text(
                            'Register today',
                            style: TextStyle(fontSize: 15),
                          ),
                          onPressed: () {
                            Navigator.push(context,
                            MaterialPageRoute(builder: (context) => registerScreen()));
                          },
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ))
              ],
            ))
    );
  }
}
