import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moovieapp/InfoScreen.dart';
import 'package:moovieapp/apidata.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'dart:convert';
import 'package:moovieapp/InfoScreen.dart';
class MovieScreen extends StatefulWidget {
  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  @override
  apiData Data = apiData();

  void initState() {
    // TODO: implement initState
    super.initState();


  }



  final CarouselController carouselController = CarouselController();

  int currentIndex = 0;
  List imageList = [
    {"id": 1, "image_path": 'assets/images/banner.png'},
    {"id": 2, "image_path": 'assets/images/bestsellersbanner.png'},
    {"id": 3, "image_path": 'assets/images/banner.png'},
    {"id": 4, "image_path": 'assets/images/banner.png'},
    {"id": 5, "image_path": 'assets/images/banner.png'},
    {"id": 6, "image_path": 'assets/images/banner.png'},
  ];
  List<String> filters = ['All', 'Drama', 'Action', 'Kids', 'Love'];
   String  selectedFilter='';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(
                    'Now Playing',
                    style: GoogleFonts.lato(
                        fontSize: 25.0, color: Color(0xFFF0AE28)),
                  ),
                )),
                SizedBox(
                    width: double.infinity,
                    child: CarouselSlider.builder(
                        itemCount: 6,
                        itemBuilder: (context, itemIndex, pageViewIndex) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 8.0, right: 8.0, top: 15.0, bottom: 8.0),
                            child: InkWell(
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => InfoScreen(title:apiData.TrendingResult[itemIndex]['title'],language:apiData.TrendingResult[itemIndex]['original_language'],background:apiData.NowPlaying[itemIndex],Overview:apiData.TrendingResult[itemIndex]['overview'],rating:apiData.TrendingResult[itemIndex]['vote_average'].toString(),date:apiData.TrendingResult[itemIndex]['release_date'],)),
                                );
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(25.0),
                                child: Container(
                                  height: 300,
                                  width: 200,
                                  child: Image.network(
                                    'https://image.tmdb.org/t/p/w300' +
                                        apiData.NowPlaying[itemIndex],
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        options: CarouselOptions(
                          autoPlay: true,
                          height: 300,
                          viewportFraction: 0.55,
                          autoPlayCurve: Curves.fastOutSlowIn,
                          autoPlayAnimationDuration: Duration(seconds: 1),
                          onPageChanged: (index, reason) {
                            setState(() {
                              currentIndex = index;
                            });
                          },
                        ))),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: imageList.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () => carouselController.animateToPage(entry.key),
                      child: Container(
                        width: currentIndex == entry.key ? 17 : 7,
                        height: 7.0,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 3.0,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: currentIndex == entry.key
                                ? Color(0xE2F0AE28)
                                : Colors.white),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 10.0,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(12.0),
                        child: GestureDetector(
                          onTap: () {
                            selectedFilter = filters[0];
                          },
                          child: Chip(
                              label: Text(
                            filters[0], style: GoogleFonts.lato(fontSize: 15.0),
                          ),
                          backgroundColor: filters[0]==selectedFilter?Color(0xE2F0AE28):Colors.grey,),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(12.0),
                        child: GestureDetector(
                          onTap: () {
                            selectedFilter = filters[1];
                          },
                          child: Chip(
                            label: Text(
                              filters[1], style: GoogleFonts.lato(fontSize: 15.0),
                            ),
                            backgroundColor: filters[1]==selectedFilter?Color(0xE2F0AE28):Colors.grey,),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(12.0),
                        child: GestureDetector(
                          onTap: () {
                            selectedFilter = filters[2];
                          },
                          child: Chip(
                            label: Text(
                              filters[2], style: GoogleFonts.lato(fontSize: 15.0),
                            ),
                            backgroundColor: filters[2]==selectedFilter?Color(0xE2F0AE28):Colors.grey,),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(12.0),
                        child: GestureDetector(
                          onTap: () {
                            selectedFilter = filters[3];
                          },
                          child: Chip(
                            label: Text(
                              filters[3], style: GoogleFonts.lato(fontSize: 15.0),
                            ),
                            backgroundColor: filters[3]==selectedFilter?Color(0xE2F0AE28):Colors.grey,),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(12.0),
                        child: GestureDetector(
                          onTap: () {
                            selectedFilter = filters[4];
                          },
                          child: Chip(
                            label: Text(
                              filters[4], style: GoogleFonts.lato(fontSize: 15.0),
                            ),
                            backgroundColor: filters[4]==selectedFilter?Color(0xE2F0AE28):Colors.grey,),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height:10.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text('Upcoming',style: GoogleFonts.lato(fontSize: 22.0,color:Colors.white),),
                ),
                SizedBox(height: 300.0,
                width: double.infinity,
                child: MovieScroller(listLength: apiData.UpcomingImage.length,listName: apiData.UpcomingImage,titleName: apiData.UpcomingResult),),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text('Rated Movies',style: GoogleFonts.lato(fontSize: 22.0,color:Colors.white),),
                ),
                SizedBox(height: 300.0,
                  width: double.infinity,
                  child: MovieScroller(listLength: apiData.RatedImage.length,listName: apiData.RatedImage,titleName: apiData.RatedResult,),),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text('Popular',style: GoogleFonts.lato(fontSize: 22.0,color:Colors.white),),
                ),
                SizedBox(height: 300.0,
                  width: double.infinity,
                  child: MovieScroller(listLength: apiData.PopularImage.length,listName: apiData.PopularImage,titleName: apiData.Populardata),),
              ],
            ),
        ),
      ),
    );
  }
}

class MovieScroller extends StatelessWidget {
  MovieScroller({required this.listLength, required this.listName,required this.titleName});
  int listLength ;
  List listName;
  List titleName;


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: listLength,
        itemBuilder: (context,index){
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0,left: 8.0,right: 8.0),
                child: InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => InfoScreen(title:titleName[index]['title'],language: titleName[index]['original_language'],background: listName[index],Overview: titleName[index]['overview'],rating: titleName[index]["vote_average"].toString(),date: titleName[index]['release_date'],)),
                    );
                     },
                  child: Container(
                    height: 250,
                    width: 150,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25.0),
                      child: Image.network(
                        'https://image.tmdb.org/t/p/w300' +
                            listName[index],
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),

              Text(titleName[index]['title'],style: GoogleFonts.lato(color:Color(0xE2F0AE28) ),),
            ],
          );
        });
  }
}
