import 'package:flutter/material.dart';
import 'package:moovieapp/moviescreen.dart';
import 'apidata.dart';
import 'constants.dart';
class SearchScroll extends StatefulWidget {
   SearchScroll({super.key, required this.movieName});
   String movieName;
  @override
  State<SearchScroll> createState() => _SearchScrollState(moviename: movieName);
}

class _SearchScrollState extends State<SearchScroll> {
  _SearchScrollState({required this.moviename});
  String moviename;
  void getSearchData(String name) async{
    print("entered and fetching data");
    await apiData().SearchData(movieName: name);
  }
  @override
  Widget build(BuildContext context) {
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
                  setState(() {
                    setState(() {

                    });
                  });
                },
                icon: const Icon(Icons.search_rounded,size: 45.0,color: Color(0xE2F0AE28),),),),
          ],
        ),
        Expanded(child: SearchScroller(listLength: apiData.SearchResult.length, listName: apiData.SearchResult, titleName: apiData.SearchResult))

      ],
    );
  }
}
