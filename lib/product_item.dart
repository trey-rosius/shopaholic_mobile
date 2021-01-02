import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductItem extends StatelessWidget {
  ProductItem(this.postItem,this.index);
  final List<dynamic> postItem;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10,bottom: 10),
      child: Card(
         color: Colors.transparent,
         elevation: 0.0,
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           mainAxisAlignment: MainAxisAlignment.start,
           children: [
             //card image

             Image.network(
                postItem[index]["img"],
               width: MediaQuery.of(context).size.width,
               height:150.0,
               fit: BoxFit.cover,
             ),
          Container(
            padding: EdgeInsets.only(left: 5,top: 10),
            child: RatingBar.builder(
              initialRating: postItem[index]["star_rating"].toDouble(),
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 20,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Container(
                child: Icon(
                  Icons.star,
                  color: Color(0xFFd57eeb),

                ),
              ),
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
          ),
             Container(
               padding: EdgeInsets.all(10),
                 child: Text(postItem[index]["name"],style: TextStyle(fontSize: 15,),)),
             Container(
                 padding: EdgeInsets.only(left: 10,bottom: 10),
                 child: Text("\$${postItem[index]["price"]}",style: TextStyle(fontSize: 15,color: Theme.of(context).primaryColor),))
           ],
         ),
      ),
    );
  }
}
