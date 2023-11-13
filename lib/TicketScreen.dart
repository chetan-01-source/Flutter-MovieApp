import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_flutter/qr_flutter.dart';
class TicketScreen extends StatelessWidget {

  TicketScreen({super.key, required this.title,required this.background,required this.rating,required this.rowind,required this.colind});
  String title;
 int rowind;
 int colind;
  String background;

  String rating;
  @override
  Widget build(BuildContext context) {
    print(title);
    print(background);
    print(rating);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            leading: Container(
              height: 70.0,
              width: 70.0,
              margin: const EdgeInsets.only(top: 8,left: 8),

              child: IconButton(onPressed: (){
                Navigator.pop(context);
              }, icon: const Icon(Icons.arrow_back_rounded,color: Color(0xE2F0AE28),size: 35.0,)),
            ),
            backgroundColor: Colors.black12,
            expandedHeight: 500,
            pinned: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(

              background: ClipRRect(
                  borderRadius: const BorderRadius.only(bottomRight: Radius.circular(24.0),bottomLeft: Radius.circular(24.0)),
                  child: Image.network('https://image.tmdb.org/t/p/w300$background',filterQuality:FilterQuality.high,fit: BoxFit.cover,)),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(padding: EdgeInsets.all(12.0),
            child: Column(
              children: [
                Text("Movie Name",style: GoogleFonts.openSans(fontSize: 30.0,fontWeight: FontWeight.w600,color: const Color(0xE2F0AE28)),),
                SizedBox(height: 16.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("$title",textAlign:TextAlign.start,style: GoogleFonts.lato(fontSize: 18,fontWeight: FontWeight.w600 ),),
                    SizedBox(width:10.0,),
                    Row(
                      children: [
                        const Icon(Icons.star,color: Color(0xE2F0AE28),size: 18.0,),
                        const SizedBox(width: 7.0,),
                        Text(rating,style: GoogleFonts.roboto(fontSize: 17.0,fontWeight: FontWeight.bold),)
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 16.0,),
                Text("Your Ticket",style: GoogleFonts.openSans(fontSize: 30.0,fontWeight: FontWeight.w600,color: const Color(0xE2F0AE28)),),
                const SizedBox(height: 16.0,),
                QrImageView(
                  data: '$title + $background + $rowind + $colind',
                  backgroundColor: Colors.white,
                  version: QrVersions.auto,
                  size: 220,
                  gapless: false,
                  embeddedImage: AssetImage('assets/movie.png'),
                  embeddedImageStyle: QrEmbeddedImageStyle(
                    size: Size(64, 64),
                  ),
                ),
                SizedBox(height: 16.0,),
                Text("Enjoy your movie!",style: GoogleFonts.openSans(fontSize: 30.0,fontWeight: FontWeight.w600,color: const Color(0xE2F0AE28)),),

              ],
            ),

            ),

          ),
        ],
      ),
    );
  }
}
