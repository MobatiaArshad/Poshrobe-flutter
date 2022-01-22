import 'package:flutter/material.dart';
import 'package:poshrob/HomeBase.dart';
import 'package:poshrob/accounts/LoginPage.dart';
import 'package:poshrob/fragments/HomePage.dart';
import 'package:flutter/services.dart';
import 'package:poshrob/shared_pref.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool userLoggedIn=false;

  @override
  void initState() {
    getLoggedInState();
    super.initState();
  }

  getLoggedInState() async{
    await HelperFunctions.getUserLoggedIn().then((value){
      setState(() {
        userLoggedIn=value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PoshRobe',
      home: userLoggedIn? HomeBase(): LoginPage(),
    );
  }
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
