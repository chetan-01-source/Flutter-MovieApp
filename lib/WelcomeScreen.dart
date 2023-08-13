import 'main.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:moovieapp/apidata.dart';



class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  apiData Data = apiData();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
    getdata1();
    getdata2();
    getdata3();
  }
  void getdata()async{
    await Data.LoadingData();
    Data.func();

  }
  void getdata1()async{
    await Data.UpcomingData();
    Data.func1();
  }
  void getdata2()async{
    await Data.RatedData();
    Data.func2();
  }
  void getdata3()async{
    await Data.PopularData();
    Data.func3();
  }
  Widget build(BuildContext context) {
    Future.delayed(
        Duration(seconds: 11),
            () =>  Navigator.pushNamed(context, 'StartScreen'),
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
                 Text('M',style:GoogleFonts.lato(textStyle:TextStyle(
                   color: Color(0xFFEBEBED),
                   fontSize: 50.0
                 ),
             ),
                 ),
                 Text('oo',style:TextStyle(
                   fontSize: 50.0,
                   color: Color(0xFFF0AE28),
                   letterSpacing: 5.0
                 ),

                 ),
                 Text('vie',style:GoogleFonts.lato(textStyle:TextStyle(
                     fontSize: 50.0,
                     color: Color(0xFFFFFFFF)
                 ),
                 ),
                 )
               ],
             ),
           ),
            SizedBox(height: 20.0,),
            ScalingText('Loading...',
            style:GoogleFonts.lato(textStyle: TextStyle(
              color: Color(0xFFF0AE28),
            ),),),

          ],
        ),
      ),

    );
  }
}
