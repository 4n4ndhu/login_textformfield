import 'package:flutter/material.dart';
import 'package:login_textformfield/view/login_screen.dart';

void main() {
  runApp(MyApp());
}

String email = "";
String password = "";


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: LoginScreen());
  }
}
