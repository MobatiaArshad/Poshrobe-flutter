import 'package:flutter/material.dart';
import 'package:poshrob/HomeBase.dart';
import 'package:poshrob/accounts/LoginPage.dart';
import 'package:poshrob/fragments/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(
        const Duration(seconds: 3),
        () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            ));

    return Scaffold(
        body: Center(
      child: Image(
        image: AssetImage('images/app_logo.png'),
        width: 200,
        height: 150,
      ),
    ));
  }
}
