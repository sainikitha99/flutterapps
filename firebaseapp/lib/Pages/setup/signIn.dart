import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseapp/Pages/home.dart';
import 'package:google_sign_in/google_sign_in.dart';
class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email, _password;
  GoogleSignIn googleAuth = new GoogleSignIn();
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
                validator: (input){
                  if(input.isEmpty){
                  return 'Please type an email';
                  }
                },
                onSaved: (input)=> _email = input,
                decoration: InputDecoration(
                  labelText: 'Email'
                ),
              ),
              TextFormField(
                validator: (input){
                  if(input.length<6){
                    return 'length is less than 6 characters';
                  }
                },
                onSaved: (input)=> _password = input,
                decoration: InputDecoration(
                    labelText: 'Password'
                ),
                obscureText: true,
              ),
              RaisedButton(
                  onPressed: signIn,
                  child: Text('Sign in'),
              ),
              RaisedButton(
                onPressed: (){

                },
                child: Text('Login with Google'),
              )
            ],
          )
      ),
    );
  }

  Future<void> signIn() async{
    final formstate = _formkey.currentState;
    if(formstate.validate()){
      formstate.save();
      try{
        FirebaseUser user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
        user.sendEmailVerification();
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Home(user : user)));
        print(user);
      }catch(e){
        print(e.message);
      }

    }
  }
}