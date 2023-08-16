import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moovieapp/InfoScreen.dart';
import 'package:moovieapp/apidata.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'dart:convert';
import 'package:moovieapp/InfoScreen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'constants.dart';
import 'SearchScroller.dart';
import 'package:circular_profile/circular_profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebasefetchdata.dart';
class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key});

  @override
  State<MovieScreen> createState() => _MovieScreenState();

}

class _MovieScreenState extends State<MovieScreen> {
  @override
  apiData Data = apiData();

  @override
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
   int myIndex=0;
  late String _uid;
  late String _name;
  late String _email;
  late int _mobile;
  late String _imgurl;


    String moviename='';
    void getData() async {


    }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          index: 0,
            color: Colors.black54,
            backgroundColor: const Color(0xff00000042),
            items:  const [
              Icon(Icons.home,color:  Color(0xE2F0AE28)),
              Icon(Icons.search_off_rounded,color:Color(0xE2F0AE28)),
              Icon(Icons.person_2_rounded,color:Color(0xE2F0AE28))
            ],
        onTap: (index){
              if(index==0){
                setState(() {
                  myIndex=0;
                });

              }
              if(index==1){
                setState(() {
                  myIndex=1;
                });
              }
              else if(index==2){
                setState(() {
                  myIndex =2;
                });

              }
        },),
        body: myIndex==0?buildSingleChildScrollView():myIndex==1?SearchScroll(movieName: moviename,):Streambuild(),
      ),
    );
  }

  SingleChildScrollView buildSingleChildScrollView() {
    return SingleChildScrollView(
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
                      fontSize: 25.0, color: const Color(0xFFF0AE28)),
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
                                MaterialPageRoute(builder: (context) => InfoScreen(title:apiData.TrendingResult[itemIndex]['title'],language:apiData.TrendingResult[itemIndex]['original_language'],background:apiData.TrendingResult[itemIndex]['poster_path'],Overview:apiData.TrendingResult[itemIndex]['overview'],rating:apiData.TrendingResult[itemIndex]['vote_average'].toString(),date:apiData.TrendingResult[itemIndex]['release_date'],)),
                              );
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(25.0),
                              child: SizedBox(
                                height: 300,
                                width: 200,
                                child: Image.network(
                                  'https://image.tmdb.org/t/p/w300' +
                                      apiData.TrendingResult[itemIndex]['poster_path'],
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
                        autoPlayAnimationDuration: const Duration(seconds: 1),
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
                              ? const Color(0xE2F0AE28)
                              : Colors.white),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(
                height: 10.0,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: GestureDetector(
                        onTap: () {
                          selectedFilter = filters[0];
                        },
                        child: Chip(
                            label: Text(
                          filters[0], style: GoogleFonts.lato(fontSize: 15.0),
                        ),
                        backgroundColor: filters[0]==selectedFilter?const Color(0xE2F0AE28):Colors.grey,),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: GestureDetector(
                        onTap: () {
                          selectedFilter = filters[1];
                        },
                        child: Chip(
                          label: Text(
                            filters[1], style: GoogleFonts.lato(fontSize: 15.0),
                          ),
                          backgroundColor: filters[1]==selectedFilter?const Color(0xE2F0AE28):Colors.grey,),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: GestureDetector(
                        onTap: () {
                          selectedFilter = filters[2];
                        },
                        child: Chip(
                          label: Text(
                            filters[2], style: GoogleFonts.lato(fontSize: 15.0),
                          ),
                          backgroundColor: filters[2]==selectedFilter?const Color(0xE2F0AE28):Colors.grey,),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: GestureDetector(
                        onTap: () {
                          selectedFilter = filters[3];
                        },
                        child: Chip(
                          label: Text(
                            filters[3], style: GoogleFonts.lato(fontSize: 15.0),
                          ),
                          backgroundColor: filters[3]==selectedFilter?const Color(0xE2F0AE28):Colors.grey,),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: GestureDetector(
                        onTap: () {
                          selectedFilter = filters[4];
                        },
                        child: Chip(
                          label: Text(
                            filters[4], style: GoogleFonts.lato(fontSize: 15.0),
                          ),
                          backgroundColor: filters[4]==selectedFilter?const Color(0xE2F0AE28):Colors.grey,),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height:10.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text('Upcoming',style: GoogleFonts.lato(fontSize: 22.0,color:Colors.white),),
              ),
              SizedBox(height: 300.0,
              width: double.infinity,
              child: MovieScroller(listLength: apiData.UpcomingResult.length,listName: apiData.UpcomingResult,titleName: apiData.UpcomingResult),),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text('Rated Movies',style: GoogleFonts.lato(fontSize: 22.0,color:Colors.white),),
              ),
              SizedBox(height: 300.0,
                width: double.infinity,
                child: MovieScroller(listLength: apiData.RatedResult.length,listName: apiData.RatedResult,titleName: apiData.RatedResult,),),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text('Popular',style: GoogleFonts.lato(fontSize: 22.0,color:Colors.white),),
              ),
              SizedBox(height: 300.0,
                width: double.infinity,
                child: MovieScroller(listLength: apiData.Populardata.length,listName: apiData.Populardata,titleName: apiData.Populardata),),
            ],
          ),
      );
  }
}

class MovieScroller extends StatelessWidget {
  MovieScroller({super.key, required this.listLength, required this.listName,required this.titleName});
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
                      MaterialPageRoute(builder: (context) => InfoScreen(title:titleName[index]['title'],language: titleName[index]['original_language'],background: titleName[index]['poster_path'],Overview: titleName[index]['overview'],rating: titleName[index]["vote_average"].toString(),date: titleName[index]['release_date'],)),
                    );
                     },
                  child: SizedBox(
                    height: 250,
                    width: 150,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25.0),
                      child: Image.network(
                        'https://image.tmdb.org/t/p/w300' +
                            titleName[index]['poster_path'],
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),

              Text(titleName[index]['title'],style: GoogleFonts.lato(color:const Color(0xE2F0AE28) ),),
            ],
          );
        });
  }
}

Column buildColumn(moviename) {
  void getSearchData(String name) async{
    print("entered and fetching data");
    await apiData().SearchData(movieName: name);
  }
  return Column(
   children: [
     Row(
       children: [
         Padding(
           padding: const EdgeInsets.only(top: 20.0,left:18.0,right:2.0),
           child: SizedBox(
             width: 300.0,
             child: TextField(
                 keyboardType: TextInputType.text,
                 textAlign: TextAlign.center,
                 style: const TextStyle(
                   color: Colors.white,
                 ),
                 onChanged: (value) {
                   moviename = value;
                   print(moviename);
                 },
                 decoration: kTextFieldDecoration.copyWith(
                     hintText: 'Enter Your Movie Here'
                 )
             ),
           ),
         ),
         Padding(
           padding: const EdgeInsets.only(top: 7.0),
               child: IconButton(
                onPressed: (){
               getSearchData(moviename);
          },
          icon: const Icon(Icons.search_rounded,size: 45.0,color: Color(0xE2F0AE28),),),),
       ],
     ),
     Expanded(child: SearchScroller(listLength: apiData.SearchResult.length, listName: apiData.SearchResult, titleName: apiData.SearchResult))

   ],
  );
}













class SearchScroller extends StatelessWidget {
  SearchScroller({super.key, required this.listLength, required this.listName,required this.titleName});
  int listLength ;
  List listName;
  List titleName;


  @override
  Widget build(BuildContext context) {
    return (titleName.isNotEmpty)? ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: listLength,
        itemBuilder: (context,index){
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0,left: 8.0,right: 8.0),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => InfoScreen(title:titleName[index]['title'],language: titleName[index]['original_language'],background: titleName[index]['poster_path'],Overview: titleName[index]['overview'],rating: titleName[index]["vote_average"].toString(),date: titleName[index]['release_date'],)),
                        );
                      },
                      child:(titleName[index]['poster_path']!=null)?SizedBox(
                        height: 250,
                        width: 150,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25.0),
                          child: Image.network(
                            'https://image.tmdb.org/t/p/w300' +
                                titleName[index]['poster_path'],
                            fit: BoxFit.contain,
                          ),
                        ),
                      ):const Text("No Result Found"),
                    ),
                  ),

                  Text(titleName[index]['title'],style: GoogleFonts.lato(color:const Color(0xE2F0AE28) ),),
                ],
              ),
            ],
          );

        }):const Text("No Result Found");
  }
}