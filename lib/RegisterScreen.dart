
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  
  @override
  String name ='';
  String email= '';
  String password = '';
  String number  = '';
  bool ShowSpinner = false;
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  Future AddUserDetails() async {
    await _firestore.collection('UserDetails').add({
      'Name':name,
      'Email':email,
      'Password':password,
      'Number':number,
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlurryModalProgressHUD(
        inAsyncCall: ShowSpinner,
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
                  keyboardType: TextInputType.text,
                  textAlign: TextAlign.center,
                  textCapitalization: TextCapitalization.characters,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  onChanged: (value) {
                    name= value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter Your Name'
                  )
              ),
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
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter Your Password'
                  )
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 28.0,right: 28.0,top: 20.0),
              child: TextField(
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  onChanged: (value) {
                    number = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter Your Mobile Number'
                  )
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25.0,left: 0.0),
              child: Material(
                elevation: 5.0,
                borderRadius:BorderRadius.only(topLeft: Radius.circular(30.0)),
                child: MaterialButton(
                  splashColor:Colors.lightBlue[200],

                  color: Color(0xE2F0AE28),
                  onPressed:() async{
                    setState(() {
                      ShowSpinner=true;
                    });



                    try{

                      final newuser = await _auth.createUserWithEmailAndPassword(email: email, password: password);
                      if(newuser!=null){
                        await AddUserDetails();
                        Navigator.pushNamed(context, 'StartScreen');
                      }
                      ShowSpinner = false;

                    }
                    catch(e){
                      print(e);
                    }


                  },
                  minWidth: 270.0,
                  height: 42.0,
                  child:  Text('Sign Up',style: GoogleFonts.lato(),),

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}