import 'package:flutter/material.dart';

class HomeHotProduct extends StatefulWidget {
  final String productName;
  final String productPhoto;
  
  HomeHotProduct(this.productName, this.productPhoto,);
  @override
  _HomeHotProductState createState() => _HomeHotProductState();
}

class _HomeHotProductState extends State<HomeHotProduct> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 190.0,
      height: 260.0,
      child: Card(
        child: Column(
          children: <Widget>[
            Text(this.widget.productName),
            Image.network(widget.productPhoto, width: 190.0, height: 160.0,)
            ],
        ),
      ),
    );
  }
}