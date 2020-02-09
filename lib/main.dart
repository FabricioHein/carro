import 'package:carros/pages/login/login_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Car App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        scaffoldBackgroundColor:  Colors.white,
     ),
      home: LoginPage(),
    );
  }
}