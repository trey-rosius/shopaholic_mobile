import 'package:flutter/material.dart';
import 'package:shopaholic/product_item.dart';
import 'package:shopaholic/wavy_header.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List> futureList;
  Future<List> get_all_posts() async {
    // This example uses the Google Books API to search for books about http.
    // https://developers.google.com/books/docs/overview
    var url = 'https://fvdwj65u51.execute-api.us-east-2.amazonaws.com/production/products';

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url,headers: {
      "x-api-key":"XOKgw1aCa47YgBkcaLtQt78kW7bZGj5U6QDVOIQh"
    });
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      print(jsonResponse.toString());
      return jsonResponse;

      //  print(itemCount.toString());
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureList = get_all_posts();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Stack(
       children: [
         Stack(
           children: [
             WavyHeader(),
             Align(
               alignment: Alignment.topLeft,
               child: SafeArea(
                 child: Container(
                   padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text('Shopaholic',style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
                       Row(
                         children: [
                           IconButton(icon: Icon(Icons.search_rounded), onPressed: (){}),
                           IconButton(icon: Icon(Icons.shopping_bag_outlined), onPressed: (){}),
                         ],
                       )
                     ],
                   ),
                 ),
               ),
             )
           ],
         ),
         Align(
           alignment: Alignment.center,
           child: Container(
             padding: EdgeInsets.only(top: 150),
             child: FutureBuilder(future: futureList,
                 builder: (context,AsyncSnapshot<List>snapshot){
                   if(snapshot.hasData)
                   {

                     return GridView.builder(
                       gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:  2,childAspectRatio: 2/3),
                       itemBuilder: (context,index){
                       return ProductItem(snapshot.data,index);

                     },itemCount: snapshot.data.length,);
                   }else if(snapshot.hasError)
                   {
                     return Container(
                       child: Center(
                         child: Icon(Icons.error),
                       ),
                     );
                   }else
                   {
                     return Container(
                       child: Center(
                         child: CircularProgressIndicator(),
                       ),
                     );
                   }
                 }),
           ),
         )
       ],
     ),
    );
  }
}
