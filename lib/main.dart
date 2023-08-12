import 'package:flutter/material.dart';
import 'package:moovieapp/LoginScreen.dart';
import 'package:moovieapp/StartScreen.dart';
import 'package:moovieapp/WelcomeScreen.dart';
import 'package:moovieapp/RegisterScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:moovieapp/moviescreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MovieApp());
}

class MovieApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(
      ),
      initialRoute: 'WelcomeScreen',
      routes: {
        'WelcomeScreen':(context)=> WelcomeScreen(),
        'StartScreen':(context)=> StartScreen(),
        'LoginScreen':(context)=> LoginScreen(),
        'RegisterScreen':(context)=> RegisterScreen(),
        'MovieScreen':(context)=> MovieScreen(),

      },
    );
  }
}
