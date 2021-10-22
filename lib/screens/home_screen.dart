import 'dart:convert';

import 'package:ecom_app/models/category.dart';
import 'package:ecom_app/models/product.dart';
import 'package:ecom_app/services/category_service.dart';
import 'package:ecom_app/services/product_service.dart';
import 'package:ecom_app/services/slider_service.dart';
import 'package:ecom_app/widgets/carousel_slider.dart';
import 'package:ecom_app/widgets/home_hot_products.dart';
import 'package:ecom_app/widgets/home_product_categories.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SliderService _sliderService = SliderService();
  CategoryService _categoryService = CategoryService();
  ProductService _productService = ProductService();

  List<Category> _categoryList = List<Category>();
  List<Product> _productList = List<Product>();
 
  var items =[];

  @override
  void initState() {
    super.initState();
    _getAllSliders();
    _getAllCategories();
    _getAllHotProducts();
  }

  _getAllSliders() async {
    var sliders = await _sliderService.getSliders();
    var result = json.decode(sliders.body);
    print(result);
    result.forEach((data){
      setState(() {
        items.add(NetworkImage(data['image_url']));        
      });
    });
    print(result);
  }

  _getAllCategories() async{
    var categories = await _categoryService.getCategories();
    var result = json.decode(categories.body);
    result['data'].forEach((data){
      var model = Category();
      model.id = data['id'];
      model.name = data['categoryName'];
      model.icon = data['categoryIcon'];
      setState(() {
        _categoryList.add(model);     
      });
    });
    print(result);
  }

  _getAllHotProducts() async{
    var hotProducts = await _productService.getHotProducts();
    var result = json.decode(hotProducts.body);
    print(result);
    result['data'].forEach((data){
      var model = Product();
      model.id = data['id'];
      model.name = data['name'];
      setState(() {
        _productList.add(model);     
      });
    });
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('eComm App'),
        backgroundColor: Colors.redAccent,
      ),

      body: Container(child: ListView(
        children: <Widget>[
          carouselSlider(items),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text('Product Categories'),
          ),

          HomeProductCategories(categorList: _categoryList,),

          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text('Hot Products'),
          ),

          HomeHotProducts(productList: _productList,),
        ],
      )),
    );
  }
}