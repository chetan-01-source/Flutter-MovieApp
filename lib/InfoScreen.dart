import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class InfoScreen extends StatelessWidget {
  InfoScreen({super.key, required this.title,required this.language,required this.background,required this.Overview,required this.rating,required this.date});
  String title;
  String language;
  String background;
  String Overview;
  String rating;
  String date;
  @override
  Widget build(BuildContext context) {
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
            child: Padding(padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
              Text("Movie Name",style: GoogleFonts.openSans(fontSize: 30.0,fontWeight: FontWeight.w600,color: const Color(0xE2F0AE28)),),
               const SizedBox(height: 16.0,),
              Text("$title : $language",textAlign:TextAlign.start,style: GoogleFonts.lato(fontSize: 18,fontWeight: FontWeight.w600 ),),
               const SizedBox(height: 16.0,),
              Text("Overview",style: GoogleFonts.openSans(fontSize: 30.0,fontWeight: FontWeight.w600,color: const Color(0xE2F0AE28)),),
                const SizedBox(height: 16.0,),
                Text(Overview,style: GoogleFonts.roboto(fontSize:24,fontWeight: FontWeight.w400),),
                const SizedBox(height: 16.0,),
                SizedBox(child: Row(
                  children: [
                    Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xE2F0AE28)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      child: Row(
                        children: [
                          Text("Release date:",style: GoogleFonts.roboto(fontSize: 17.0,fontWeight: FontWeight.bold),),
                          const SizedBox(width: 14.0,),
                          Text(date,style: GoogleFonts.roboto(fontSize: 17.0,fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ),
                    const SizedBox(width: 40.0,),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xE2F0AE28)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.star,color: Color(0xE2F0AE28),size: 18.0,),
                          const SizedBox(width: 7.0,),
                          Text(rating,style: GoogleFonts.roboto(fontSize: 17.0,fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ),
                  ],
                ),)
              ],
            ),),
          )
        ],
      ),

    );
  }
}
