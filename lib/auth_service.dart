import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project_dicoding/sign_up.dart';

class AuthServices {
  static FirebaseAuth _auth = FirebaseAuth.instance;
  static Future<User?> SignInAnonymous() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User firebaseUser = result.user!;

      return firebaseUser;
    } catch (e) {
      print(e.toString());

      return null;
    }
  }

  static Future<User?> SignUp(email, password, BuildContext context) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User firebaseUser = result.user!;

      return firebaseUser;
    } on FirebaseAuthException catch (e) {
      showDialog(
          context: context,
          builder: (_) =>
              alertDialog(context: context, message: Text("${e.message}")));
      return null;
    }
  }

  static Future<User?> SignInEmailPass(
      email, password, BuildContext context) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User firebaseUser = result.user!;

      return firebaseUser;
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: (_) =>
              alertDialog(context: context, message: Text("${e.message}")));
      return null;
    }
  }

  static Future<void> SignOut() async {
    _auth.signOut();
  }

  static Stream<User?> get firebaseUserStream => _auth.authStateChanges();
}
