import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductDescriptionScreen extends StatefulWidget {
  ProductDescriptionScreen({this.id,this.name,this.rating,this.description,this.price,this.img});
  final String id;
  final String name;
  final int rating;
  final String description;
  final double price;
  final String img;
  @override
  _ProductDescriptionScreenState createState() => _ProductDescriptionScreenState();
}

class _ProductDescriptionScreenState extends State<ProductDescriptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250.0,
            floating: true,
            pinned: true,
            snap: false,
            backgroundColor: Theme.of(context).accentColor,
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: <StretchMode>[
                StretchMode.zoomBackground,
                StretchMode.blurBackground,
                StretchMode.fadeTitle,
              ],
              centerTitle: true,
              title: Hero(
                tag: widget.id,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Image.network(
                    widget.img,
                    width: MediaQuery.of(context).size.width,
                    height:150.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          padding: EdgeInsets.all(10),
                          child: Text(widget.name,style: TextStyle(fontSize: 17,),)),
                      Container(
                        padding: EdgeInsets.only(left: 5,top: 10),
                        child: RatingBar.builder(
                          initialRating: widget.rating.toDouble(),
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
                    ],
                  ),

                      Text(widget.description,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('\$' + widget.price.toString(),style: TextStyle(fontSize: 20,color: Theme.of(context).primaryColor),),
                      RaisedButton(
                        color: Theme.of(context).primaryColor,
                        onPressed: (){},child: Text("Add to cart"),)
                    ],
                  )


                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
