import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/login.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  await Firebase.initializeApp();
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Login()));
}

