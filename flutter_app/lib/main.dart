
import 'package:flutter/material.dart';
import 'package:flutter_app/views/login/Login_view.dart';

void main() => runApp(
    MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginApp(),
    );
  }
}
