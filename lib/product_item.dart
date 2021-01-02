import 'package:flutter/material.dart';

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
               padding: EdgeInsets.all(10),
                 child: Text(postItem[index]["name"],style: TextStyle(fontSize: 20,),)),
             Container(
                 padding: EdgeInsets.all(10),
                 child: Text("\$${postItem[index]["price"]}",style: TextStyle(fontSize: 16,),))
           ],
         ),
      ),
    );
  }
}
