import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preference_example/models/product_model.dart';
import 'package:shared_preference_example/screens/cart_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<ProductModel> products = [
    ProductModel(name:  "High Heel", category: "Shose", price: 100.0, image: "https://i.pinimg.com/originals/61/ea/f2/61eaf2b3d3d2d623290b0818c64d706f.jpg"),
    ProductModel(name:  "Hand Bag", category: "Bags", price: 400.0, image: "https://cdn.webshopapp.com/shops/297454/files/408593877/britt-classic-grain-hand-bags-green-5338-black.jpg"),
    ProductModel(name:  "Sport Watch", category: "Watch", price: 250.0, image: "https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1667841595-fitbit-sense-with-gps-1667841589.jpg?crop=1xw:1xh;center,top&resize=980:*"),
    ProductModel(name:  "Middle Heel", category: "Shose", price: 550.0, image: "https://dynamic.zacdn.com/UGVuGI5ibkQwdZuDcpQXDPCnHSo=/filters:quality(70):format(webp)/https://static-my.zacdn.com/p/nose-3896-2375882-1.jpg"),
    ProductModel(name:  "Back Bag", category: "Bags", price: 600.0, image: "https://images-eu.ssl-images-amazon.com/images/I/61IOPtBozeL._AC_SR462,693_.jpg"),
    ProductModel(name:  "Ankle Boots", category: "Shose", price: 750.0, image: "https://m.media-amazon.com/images/I/51sZhauGStL.jpg"),
    ProductModel(name:  "traval Bag", category: "Bags", price: 450.0, image: "https://m.media-amazon.com/images/I/71myiEqRckL._AC_UY1100_.jpg"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("Products"),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:(context) => CartScreen(products: products,)));
          }, icon: Icon(Icons.shopping_cart))
        ],
      ),

      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(products[index].name!),
              subtitle: Text(products[index].category!),
              // leading: Text(products[index].price.toString()),
              leading: Hero(
              tag: products[index].price.toString(),
              child: Image.network(
                products[index].image!,
                width: 50,
                height: 50,
              ),
            ),
              trailing: IconButton(onPressed: () async{
                SharedPreferences prefs = await SharedPreferences.getInstance();

                String data = jsonEncode(products[index].toMap());

                prefs.setString(products[index].name!, data);
              }, icon: Icon(Icons.add_shopping_cart)),
            ),
          );
        },),
    );
  }
}