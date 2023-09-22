import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preference_example/models/product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartScreen extends StatefulWidget {
  CartScreen({super.key, required this.products});

  List<ProductModel> products;

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  @override
  void initState() {
    // TODO: implement initState
    _getData();
    super.initState();
  }

  List<ProductModel> cartProducts = [];

  _getData() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    for (var element in widget.products) {
      if(prefs.containsKey(element.name!)){
        cartProducts.add(element);
      }      
    }
    setState(() {
      
    });
    // String data = prefs.getString("High Heel") ?? "";
    // Map<String, dynamic> map = jsonDecode(data);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("Cart"),
      ),
      body: ListView.builder(
        itemCount: cartProducts.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              trailing: InkWell(
                onTap: () async{

                  SharedPreferences prefs = await SharedPreferences.getInstance();

                  prefs.remove(cartProducts[index].name!);
                  cartProducts.remove(cartProducts[index]);
                
                },
                child: Text("Remove From Carts")),
              title: Text(cartProducts[index].name!),
              subtitle: Text(cartProducts[index].category!),
              // leading: Text(cartProducts[index].price.toString()),
              leading: Hero(
              tag: cartProducts[index].price.toString(),
              child: Image.network(
                cartProducts[index].image!,
                width: 50,
                height: 50,
              ),
            ),
              
            ),
          );
        },),
    );
  }
}