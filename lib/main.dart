import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ap_assignment_project/WelcomePage.dart';
import 'package:ap_assignment_project/SignUp.dart';
import 'package:ap_assignment_project/HomePage.dart';
import 'package:ap_assignment_project/LogIn.dart';
import 'package:ap_assignment_project/SaveInfo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyBU8BWk7cE3Ppg-v5rAeTjs8JYgX4YLgMA',
      appId: '1:1034481871803:web:53f4ea257f0f02017ccf96',
      projectId: 'flutterassignment-834cf', messagingSenderId: '',
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Students Information Recording System',
      initialRoute: '/welcome', // Set the initial route to the welcome page
      routes: {
        '/welcome': (context) => WelcomePage(),
        '/Signup': (context) => SignUpPage(),
        '/Login': (context) => LogInPage(),
        '/home': (context) => Home(),
        '/saveinfo': (context) => SaveInfo(),
      },
    );
  }
}
