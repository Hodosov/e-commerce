import 'package:firebase_storage/firebase_storage.dart';
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
  final FirebaseAuth _auth = FirebaseAuth.instance;
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
      setState(() {
        loading = false;
      });
  }

  void handleSingIn() async {
    preferences = await SharedPreferences.getInstance();
    setState(() {
      loading = true;
    });

    final GoogleSignInAccount? account = await googleSignIn.signIn();
    final GoogleSignInAuthentication authentication =
        await account!.authentication;

    final OAuthCredential credential = GoogleAuthProvider.credential(
        idToken: authentication.idToken,
        accessToken: authentication.accessToken);

    final UserCredential authResult =
        await _auth.signInWithCredential(credential);
    final User? user = authResult.user;

    if (user != null) {
      final QuerySnapshot result = await FirebaseFirestore.instance
          .collection('users')
          .where('id', isEqualTo: user.uid)
          .get();
      final List<DocumentSnapshot> documents = result.docs;
      if (documents.length == 0) {
        FirebaseFirestore.instance.collection('user').doc(user.uid).set({
          "id": user.uid,
          "username": user.displayName,
          "profilePicture": user.photoURL
        });

        await preferences.setString('id', user.uid);
        await preferences.setString('username', '$user.displayName');
        await preferences.setString('profilePicture', user.uid);
      } else {
        await preferences.setString('id', documents[0]['id']);
        await preferences.setString('username', documents[0]['username']);
        await preferences.setString(
            'profilePicture', documents[0]['profilePicture']);
      }

      Fluttertoast.showToast(msg: "Login was successful");
      if (isLogedin) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      }

    
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text("Login"),
        elevation: 0.5,
      ),
      body: Stack(children: <Widget>[
        Center(
            child: TextButton(
          onPressed: () {
            handleSingIn();
          },
          child: const Text("Sign in / Sing up with google"),
        )),
        Visibility(
            visible: loading,
            child: Center(
              child: Center(
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.white.withOpacity(0.7),
                  child: const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                  ),
                ),
              ),
            ))
      ]),
    );
  }
}
