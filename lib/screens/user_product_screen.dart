import 'package:flutter/material.dart';
import 'package:flutter_provider_udemy/providers/product.dart';
import 'package:flutter_provider_udemy/providers/products.dart';
import 'package:flutter_provider_udemy/screens/edit_product_screen.dart';
import 'package:flutter_provider_udemy/widgets/app_drawer.dart';
import 'package:flutter_provider_udemy/widgets/user_product_item.dart';
import 'package:provider/provider.dart';

class UserProductScreen extends StatelessWidget{
  //const UserProductScreen({Key? key}) : super(key: key);

  static const routename = '/user product';
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Product"),
        actions: [
          IconButton(
            onPressed: () {
              // final id = productData.items.length+1;
              // print(id.toString()+">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
              // productData.items.add(
              //   Product(
              //     id: '',
              //     title: '',
              //     description: '',
              //     price: 0.0,
              //     imageUrl: 'https://i.pinimg.com/474x/0b/1d/bc/0b1dbc4aaaf7bc592325a70affe8b3ba.jpg',
              //   ),
              // );
              // notifyListeners();
              Navigator.of(context).pushNamed(EditProductScreen.routeName,arguments: '');
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: productData.items.length,
        itemBuilder: (context, i) => Column(
          children: [
            UserProductItem(
              productData.items[i].title,
              productData.items[i].imageUrl,
              productData.items[i].id,
            ),
          ],
        ),
      ),
    );
  }
}
