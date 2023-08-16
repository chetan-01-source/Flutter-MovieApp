import 'dart:convert';
import 'package:http/http.dart' as http;
class apiData{
 static List TrendingResult = [];

 static List RatedResult =[];

 static List UpcomingResult =[];


 static List Populardata=[];

 static List SearchResult=[];

 final String apiKey = '4e7425cf892846983ddcb1d1f11b7714';
 int j =0;
 final String ReadAccessToken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0ZTc0MjVjZjg5Mjg0Njk4M2RkY2IxZDFmMTFiNzcxNCIsInN1YiI6IjY0Y2U3Nzc2NGQ2NzkxMDExYzE3MmI4NiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.8oQv9QyqMiXOshsCPNn_yiVY2ubBhhzKnsf2exOiFGo';
 Future LoadingData()async{
  http.Response response = await http.get(Uri.parse('https://api.themoviedb.org/3/movie/now_playing?api_key=$apiKey'));
  if(response.statusCode==200){
   String data = response.body;
   Map<String,dynamic> map = await jsonDecode(data.toString());
   TrendingResult = await map['results'];
   print(TrendingResult);
  }
  else{
   print(response.statusCode);
  }
 }

 Future UpcomingData() async{
  http.Response response1 = await http.get(Uri.parse('https://api.themoviedb.org/3/movie/upcoming?api_key=$apiKey'));
  if(response1.statusCode==200){
   String data = response1.body;
   Map<String,dynamic> map = await jsonDecode(data.toString());
   UpcomingResult = await map['results'];
   print(UpcomingResult);


  }
  else{
   print(response1.statusCode);
  }
 }

 Future RatedData() async{
  http.Response response1 = await http.get(Uri.parse('https://api.themoviedb.org/3/movie/top_rated?api_key=$apiKey'));
  if(response1.statusCode==200){
   String data = response1.body;

   Map<String,dynamic> map = await jsonDecode(data.toString());
   RatedResult = await map['results'];
   print(RatedResult);
  }
  else{
   print(response1.statusCode);
  }
 }

 Future PopularData() async{
  http.Response response1 = await http.get(Uri.parse('https://api.themoviedb.org/3/movie/popular?api_key=$apiKey'));
  if(response1.statusCode==200){
   String data = response1.body;

   Map<String,dynamic> map = await jsonDecode(data.toString());
   Populardata = await map['results'];
   print(Populardata);
  }
  else{
   print(response1.statusCode);
  }
 }

 Future SearchData({required String movieName}) async{
  http.Response response1 = await http.get(Uri.parse('https://api.themoviedb.org/3/search/movie?query=$movieName&api_key=4e7425cf892846983ddcb1d1f11b7714'));
  if(response1.statusCode==200){
   String data = response1.body;

   Map<String,dynamic> map = await jsonDecode(data.toString());
   SearchResult = await map['results'];
   print(SearchResult);

  }
  else{
   print(response1.statusCode);
  }
 }
}


