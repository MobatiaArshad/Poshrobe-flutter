import 'package:flutter/material.dart';
import 'package:poshrob/HomeBase.dart';
import 'package:poshrob/accounts/LoginPage.dart';
import 'package:poshrob/fragments/HomePage.dart';
import 'package:flutter/services.dart';
import 'package:poshrob/shared_pref.dart';
import 'package:shared_preferences/shared_preferences.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  bool? userLoggedIn= await HelperFunctions.getUserLoggedIn();
  runApp(
      MaterialApp(
    title: 'PoshRobe',
    home: (userLoggedIn??false)? HomeBase(): LoginPage(),
  ));
}



// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     Future.delayed(
//         const Duration(seconds: 3),
//         () => Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => LoginPage()),
//             ));
//
//     return Scaffold(
//         body: Center(
//       child: Image(
//         image: AssetImage('images/app_logo.png'),
//         width: 200,
//         height: 150,
//       ),
//     ));
//   }
// }
