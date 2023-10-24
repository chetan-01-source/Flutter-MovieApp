import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:moovieapp/apidata.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:moovieapp/moviescreen.dart';


class WelcomeScreen extends StatefulWidget {
  static  bool login=false;
  @override

  State<WelcomeScreen> createState() => _WelcomeScreenState();

}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  apiData Data = apiData();

  var auth = FirebaseAuth.instance;
  checkifLogin() async{
    auth.authStateChanges().listen((User? user) {
      if(user!=null && mounted){
        setState(() {
          WelcomeScreen.login = true;
        });
      }
    });
  }
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
    getdata1();
    checkifLogin();
  }
  void getdata()async{
    await Data.LoadingData();
  }
  void getdata1()async{
    await Data.UpcomingData();
  }


  @override
  Widget build(BuildContext context) {
    Future.delayed(
        const Duration(seconds: 10),
            ()  {
               if(WelcomeScreen.login==true){
                 Navigator.pushNamed(context, 'MovieScreen');
               }
               else{
                 Navigator.pushNamed(context, 'StartScreen');
               }

            },
            );
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: 'logo',
                child: Image.asset('assets/movie.png',height: 200.0,width: 200.0)),
           Padding(
             padding: const EdgeInsets.only(top: 25.0,left:110.0),
             child: Row(
               children: [
                 Text('M',style:GoogleFonts.lato(textStyle:const TextStyle(
                   color: Color(0xFFEBEBED),
                   fontSize: 50.0
                 ),
             ),
                 ),
                 const Text('oo',style:TextStyle(
                   fontSize: 50.0,
                   color: Color(0xFFF0AE28),
                   letterSpacing: 5.0
                 ),

                 ),
                 Text('vie',style:GoogleFonts.lato(textStyle:const TextStyle(
                     fontSize: 50.0,
                     color: Color(0xFFFFFFFF)
                 ),
                 ),
                 )
               ],
             ),
           ),
            const SizedBox(height: 20.0,),
            ScalingText('Loading...',
            style:GoogleFonts.lato(textStyle: const TextStyle(
              color: Color(0xFFF0AE28),
            ),),),

          ],
        ),
      ),

    );
  }
}
