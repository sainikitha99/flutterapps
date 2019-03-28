import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseapp/Pages/home.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);



  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email, _password;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Home(user : user)));
        print(user);
      }catch(e){
        print(e.message);
      }

    }
  }
}