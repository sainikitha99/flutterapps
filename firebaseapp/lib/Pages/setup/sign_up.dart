import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseapp/Pages/setup/signIn.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUpPage> {
  String _email, _password;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Form(
          key: _formkey,
          child: Column(
            children: <Widget>[
              TextFormField(
                validator: (input) {
                  if (input.isEmpty) {
                    return 'Please type an email';
                  }
                },
                onSaved: (input) => _email = input,
                decoration: InputDecoration(
                    labelText: 'Email'
                ),
              ),
              TextFormField(
                validator: (input) {
                  if (input.length < 6) {
                    return 'length is less than 6 characters';
                  }
                },
                onSaved: (input) => _password = input,
                decoration: InputDecoration(
                    labelText: 'Password'
                ),
                obscureText: true,
              ),
              RaisedButton(
                onPressed: signUp,
                child: Text('Sign Up'),
              )
            ],
          )
      ),
    );
  }
    Future<void> signUp() async {
      final formstate = _formkey.currentState;
      if (formstate.validate()) {
        formstate.save();
        try {
           await FirebaseAuth.instance
              .createUserWithEmailAndPassword(email: _email, password: _password);
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));

        } catch (e) {
          print(e.message);
        }
      }
    }

  }

