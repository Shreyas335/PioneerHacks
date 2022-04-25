import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'auth.dart';
//import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'home.dart';
//import 'package:app/login/login_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Welcome to Flutter', home: Home());
  }
}
