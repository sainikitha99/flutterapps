import 'package:flutter/material.dart';
import 'package:firebaseapp/Pages/setup/signIn.dart';
import 'package:firebaseapp/Pages/setup/sign_up.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Firebase app'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          RaisedButton(
            onPressed: NavigateToSignIn,
            child: Text('Sign in'),
          ),
          RaisedButton(
            onPressed: NavigateToSignUp,
            child: Text('Sign up'),
          )
        ],
      ),
    );
  }


 void NavigateToSignIn(){
   Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage(), fullscreenDialog: true));

 }

 void NavigateToSignUp(){
   Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpPage(), fullscreenDialog: true));

 }
}
