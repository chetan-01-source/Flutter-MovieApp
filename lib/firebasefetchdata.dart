import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:circular_profile/circular_profile.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'WelcomeScreen.dart';
class Streambuild extends StatefulWidget {
  const Streambuild({Key? key}) : super(key: key);

  @override
  State<Streambuild> createState() => _StreambuildState();
}

class _StreambuildState extends State<Streambuild> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
  }
  late User? loggedinUser =  _auth.currentUser;
  final FirebaseAuth  _auth = FirebaseAuth.instance;
  void getUser() async{
     loggedinUser = await _auth.currentUser;
    print("waiting");
    try{
      if(loggedinUser!=null){
        print("user got");
        print(loggedinUser!.email);
      }
    }
    catch(e){
      print(e);
    }
  }
  Widget build(BuildContext context) {

      return StreamBuilder(stream: FirebaseFirestore.instance.collection('UserDetails').where('Email',isEqualTo: loggedinUser!.email ).snapshots(),
        builder: (context,AsyncSnapshot<QuerySnapshot> snapshot) {
          if(snapshot.hasError){
            return Text("soething went wrong");
          }
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CupertinoActivityIndicator());
          }
          if(snapshot.data!.docs.isEmpty){
            return Text("Data not found");
          }
          if(snapshot != null && snapshot.data != null){
            return Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 300.0,top:20.0),
                    child: IconButton(onPressed: (){
                      setState(() {
                        _auth.signOut();
                        Navigator.pushNamed(context, 'StartScreen');
                      });
                    }, icon: Icon(Icons.logout_rounded,size: 35.0,color:Color(0xE2F0AE28),)),
                  ),
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 55.0,top: 140.0),
                        child:Container(
                          height: 200,
                          width: 300,
                          child: Card(
                            elevation: 15.0,// this field changes the shadow of the card 1.0 is default
                            shape: RoundedRectangleBorder(
                              side: BorderSide(width: 0.2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            color: Colors.white60,
                            shadowColor:Color(0xE2F0AE28) ,
                          ),
                        ),
                      ),
                      Positioned(child:Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 80),
                            child: CircularProfile(
                              backgroundColor: Colors.amberAccent,
                              image: NetworkImage(snapshot.data!.docs[0]['imagelink']),
                              radius:50.0 ,
                            ),
                          ),
                          SizedBox(height: 30.0,),
                          Padding(
                            padding: const EdgeInsets.only(left: 80.0),
                            child: Row(
                              children: [
                                Text("Name:",style: GoogleFonts.roboto(
                                    fontSize: 18.0,
                                    color: Colors.black
                                ),),
                                SizedBox( width: 5.0,),
                                Text(snapshot.data!.docs[0]['Name'],style: GoogleFonts.roboto(
                                    fontSize: 18.0,color: Colors.black,fontWeight: FontWeight.w500
                                ),),
                              ],
                            ),

                          ),
                          SizedBox(height: 20.0,),
                          Padding(
                            padding: const EdgeInsets.only(left: 80.0),
                            child: Row(
                              children: [
                                Text("Email:",style: GoogleFonts.roboto(
                                    fontSize: 18.0,
                                    color: Colors.black
                                ),),
                                SizedBox( width: 5.0,),
                                Text(snapshot.data!.docs[0]['Email'],style: GoogleFonts.roboto(
                                    fontSize: 13.0,color: Colors.black,fontWeight: FontWeight.w500
                                ),),
                              ],
                            ),
                          ),
                          SizedBox(height: 20.0,),
                          Padding(
                            padding: const EdgeInsets.only(left: 80.0),
                            child: Row(
                              children: [
                                Text("Mobile No:",style: GoogleFonts.roboto(
                                    fontSize: 18.0,
                                    color: Colors.black
                                ),),
                                SizedBox( width: 5.0,),
                                Text(snapshot.data!.docs[0]['Number'],style: GoogleFonts.roboto(
                                    fontSize: 13.0,color: Colors.black,fontWeight: FontWeight.w500
                                ),),
                              ],
                            ),
                          ),

                        ],
                      ) )
                    ],
                  ),


                ],
              ),
            );
          }
          return Container();
        },);

  }
}
