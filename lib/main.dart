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
  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(
      ),
      initialRoute: 'WelcomeScreen',
      routes: {
        'WelcomeScreen':(context)=>  WelcomeScreen(),
        'StartScreen':(context)=> const StartScreen(),
        'LoginScreen':(context)=> const LoginScreen(),
        'RegisterScreen':(context)=> const RegisterScreen(),
        'MovieScreen':(context)=> const MovieScreen(),



      },
    );
  }
}
