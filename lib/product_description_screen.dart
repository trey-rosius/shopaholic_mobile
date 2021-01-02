import 'package:flutter/material.dart';

class ProductDescriptionScreen extends StatefulWidget {
  ProductDescriptionScreen({this.id,this.name,this.rating,this.description,this.price,this.img});
  final String id;
  final String name;
  final int rating;
  final String description;
  final int price;
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

            expandedHeight: 150.0,
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
        ],
      ),
    );
  }
}
