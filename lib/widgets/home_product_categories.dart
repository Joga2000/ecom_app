import 'package:ecom_app/models/category.dart';
import 'package:flutter/material.dart';

import 'home_product_category.dart';

class HomeProductCategories extends StatefulWidget {
  final List<Category> categorList;
  HomeProductCategories({this.categorList});
  @override
  _HomeProductCategoriesState createState() => _HomeProductCategoriesState();
}

class _HomeProductCategoriesState extends State<HomeProductCategories> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 205,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: this.widget.categorList.length,
        itemBuilder: (context, index){
          return HomeProductCategory(this.widget.categorList[index].icon, this.widget.categorList[index].name);
        },
      ),
    );
  }
}