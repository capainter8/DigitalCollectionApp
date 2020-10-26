
import 'package:DigitalCollectionApp/services/Auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class registerScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _registerScreen();
  }
}

class _registerScreen extends State<registerScreen> {

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
            Text("Sign Up"),
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
                color: Colors.deepOrange),),
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
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.black,
                      child: Text('Register' ,style: TextStyle(fontSize: 20)),
                      onPressed: () {
                        //register
                        context.read<Auth>().register(
                          email: emailController.text,
                          password: passwordController.text
                        );
                        
                         //add to cloud
                        /*FirebaseFirestore.instance.collection("users").doc(emailController.text).set(
                          {
                            'email': emailController.text,
                            'password': passwordController.text
                            });*/

                     
                     
                      },
                    )),
              ],
            ))
    );
  }
}
