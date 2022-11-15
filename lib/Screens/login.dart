import 'package:flutter/material.dart';
import 'package:people/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:people/resources/auth_methods.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage> {
  final AuthMethods _authMethods = AuthMethods();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Start or join a meeting",
            style: TextStyle(fontSize: 25.0, color: Colors.white),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Image(
              image: AssetImage("images/onboarding.jpg"),
            ),
          ),
          CustomButton(
            text: "Google Sign In",
            onPressed: () async{
              bool res = await _authMethods.signInWithGoogle(context);
              if(res){
                Navigator.pushNamed(context, 'homeScreen');
              }
            },
          ),
        ],
      ),
    );
  }
}
