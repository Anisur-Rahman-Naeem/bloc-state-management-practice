import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  Future login() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: "email5@gmail.com",
      password: "654321",).then((value) {
      print('login success');
    }).onError((error, stackTrace) {
      print('failed ${error.toString()}');
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(onPressed: () {
          login();
        }, child: Text('login')),
      ),
    );
  }
}
