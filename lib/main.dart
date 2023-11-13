import 'package:flutter/material.dart';
import 'package:moovieapp/LoginScreen.dart';
import 'package:moovieapp/StartScreen.dart';
import 'package:moovieapp/WelcomeScreen.dart';
import 'package:moovieapp/RegisterScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:moovieapp/moviescreen.dart';
import 'package:moovieapp/paymentmethod.dart';
import 'seat.dart';
import 'TicketScreen.dart';
import 'Firebase_messaging.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> backgroundHandler(RemoteMessage message) async {
  print(message.data.toString());
  print(message.notification!.title);
}

void main() async {
  message msg = message();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);

  await msg.fcm();
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
