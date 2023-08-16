import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Hero(tag: 'logo', child: Padding(
            padding: const EdgeInsets.only(left:68.0),
            child: Image.asset('assets/movie.png',height: 200.0,width: 200.0),
          )),
          Padding(
            padding: const EdgeInsets.only(top: 25.0,left: 80.0),
            child: Material(
              elevation: 5.0,
              child: MaterialButton(
                splashColor: Colors.lightBlue[200],
                color: const Color(0xE2F0AE28),
                  onPressed:(){
                  Navigator.pushNamed(context, 'LoginScreen');
                  },
                  minWidth: 270.0,
                height: 42.0,
                child:  Text('Log In',
                style: GoogleFonts.lato(),
              ),
            ),
          ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25.0,left: 80.0),
            child: Material(
              elevation: 5.0,
              borderRadius:const BorderRadius.only(topLeft: Radius.circular(30.0)),
                  child: MaterialButton(
                    splashColor: Colors.lightBlue[200],

                color: const Color(0xE2F0AE28),
                onPressed:(){
                      Navigator.pushNamed(context, 'RegisterScreen');
                },
                minWidth: 270.0,
                height: 42.0,
                child:  Text('Sign Up',style: GoogleFonts.lato(),),

              ),
            ),
          )
        ],
      ),
    );
  }
}
