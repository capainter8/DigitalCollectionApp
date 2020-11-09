

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';




class Auth
{
  final FirebaseAuth auth;
  Auth(this.auth);

  Stream<User> get authStateChanges => auth.authStateChanges();

  Future<String> login ({String email, String password}) async
  {
    try{
      await auth.signInWithEmailAndPassword(email: email, password: password);
      return "signed in";
    }
    on FirebaseAuthException catch (error){
       print("exeption caught");
       print(error.message);
       print("error code:" + error.code);

       /*if(error.code == "invalid-email")
       {
          print("invalid email caught");
       }
      else if (error.code == "user-not-found") 
       {
         print("UNF caught");
       }
       else */
       if(error.code == "too-many-requests")
       {
         print("yy");
       }
      
  
       return error.message;
  }
  }

  Future<String> register ({String email, String password}) async
  {
    try{
      await auth.createUserWithEmailAndPassword(email: email, password: password);
      return "registered";
    }on FirebaseAuthException catch (error){
      print("error caught");
      return error.message;
    }
  }

  Future<void> logout () async{
    await auth.signOut();
  }
  }
