import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home.dart';
import "package:shared_preferences/shared_preferences.dart";
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  late SharedPreferences preferences;
  bool loading = false;
  bool isLogedin = false;

  @override
  void initState() {
    super.initState();
    isSignedIn();
  }

   void isSignedIn() async {
     setState(() {
       loading = true;
     });

     preferences = await SharedPreferences.getInstance();
     isLogedin = await googleSignIn.isSignedIn();
     if(isLogedin) {
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>HomePage()));
     }

     setState(() {
       loading = false;
     });

     Future handleSingIn() async {
       preferences = await SharedPreferences.getInstance();

       setState(() {
         loading = true;
       });

       GoogleSignInAccount? googleUser = await googleSignIn.signIn();
       Future<GoogleSignInAuthentication> googleSignInAuthentication = googleUser!.authentication;
     }
   }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

 
}
