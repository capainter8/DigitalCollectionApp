
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';

class forgotScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _forgotScreen();
  }
}

class _forgotScreen extends State<forgotScreen> {


 TextEditingController emailController = TextEditingController();

 void resetPassowrd(BuildContext buildContext)async
    {
      await FirebaseAuth.instance.sendPasswordResetEmail(email:emailController.text);
      Fluttertoast.showToast(msg: "Email has been sent to reset your password");
    }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
           appBar: AppBar(
          elevation: 0.0,
          title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Reset Password"),
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
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.black,
                      child: Text('Reset Password' ,style: TextStyle(fontSize: 20)),
                      onPressed: () {
                            
                        
                      },
                    )),
              ],
            ))
    );
  }
}
