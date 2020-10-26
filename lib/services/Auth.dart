

import 'package:firebase_auth/firebase_auth.dart';




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
    }on FirebaseAuthException catch (error){
      return error.message;
    }
  }

  Future<String> register ({String email, String password}) async
  {
    try{
      await auth.createUserWithEmailAndPassword(email: email, password: password);
      return "registered";
    }on FirebaseAuthException catch (error){
      return error.message;
    }
  }

  Future<void> logout () async{
    await auth.signOut();
  }

}