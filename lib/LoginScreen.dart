import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoginScreen extends StatefulWidget {

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}


class _LoginScreenState extends State<LoginScreen> {
  @override
  bool ShowSpinner1 = false;
  String email= '';
  String password = '';
  final _auth = FirebaseAuth.instance;

  Widget build(BuildContext context) {
    return Scaffold(
      body: BlurryModalProgressHUD(
        inAsyncCall: ShowSpinner1,
        blurEffectIntensity: 4,
        progressIndicator: SpinKitFadingCircle(
          color: Color(0xE2F0AE28),
          size: 90.0,
        ),
        dismissible: false,
        opacity: 0.4,
        color: Colors.black87,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Hero(tag: 'logo', child: Padding(
                padding: const EdgeInsets.only(left:8.0),
                child: Image.asset('assets/movie.png',height: 200.0,width: 200.0),
              )),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 28.0,right: 28.0,top: 20.0),
              child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your email'
                  )
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 28.0,right: 28.0,top: 20.0),
              child: TextField(

                  obscureText: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  onChanged: (value) {
                    password = value;
                    print(password);
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter Your Password'
                  )
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25.0,left: 0.0),
              child: Material(
                elevation: 5.0,
                borderRadius:BorderRadius.only(topLeft: Radius.circular(30.0)),
                child: MaterialButton(
                  splashColor: Colors.lightBlue[200],

                  color: Color(0xE2F0AE28),
                  onPressed:() async{
                    setState(() {
                      ShowSpinner1 = true;
                    });
                    try{
                      final user = await _auth.signInWithEmailAndPassword(email: email, password: password);
                      if(user!=null){

                        Navigator.pushNamed(context, 'MovieScreen' );
                      }


                    }
                    catch(e){
                      setState(() {
                        ShowSpinner1= false;
                      });
                      Alert(context: context,title: "ALERT!!",desc: "Invalid Credentials.Please Enter Information Correct!").show();
                    }

                    setState(() {
                      ShowSpinner1= false;
                    });

                  },
                  minWidth: 270.0,
                  height: 42.0,
                  child:  Text('Log In',style: GoogleFonts.lato(),),

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


