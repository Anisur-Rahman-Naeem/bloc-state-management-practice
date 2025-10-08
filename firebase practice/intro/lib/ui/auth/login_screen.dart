import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text("Login",style: TextStyle(
            color: Colors.white
          ),),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
