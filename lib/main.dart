import 'package:flutter/material.dart';
import 'package:flutter_provider_udemy/providers/cart.dart';
import 'package:flutter_provider_udemy/providers/home_state.dart';
import 'package:flutter_provider_udemy/providers/orders.dart';
import 'package:flutter_provider_udemy/providers/products.dart';
import 'package:flutter_provider_udemy/screens/cart_screen.dart';
import 'package:flutter_provider_udemy/screens/edit_product_screen.dart';
import 'package:flutter_provider_udemy/screens/order_screen.dart';
import 'package:flutter_provider_udemy/screens/product_detail_Screen.dart';
import 'package:flutter_provider_udemy/screens/product_overview_screens.dart';
import 'package:flutter_provider_udemy/screens/user_product_screen.dart';
import 'package:provider/provider.dart';
import 'package:dcdg/dcdg.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Orders()),
        ChangeNotifierProvider.value(value: Cart(),),
        ChangeNotifierProvider.value(value: Products(),),
        ChangeNotifierProvider.value(value: HomeState()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.lightGreen,
          //primaryColor: Colors.purple,
          secondaryHeaderColor: Colors.teal,
        ),
        home: const ProductsOverviewScreen(),
        routes: {
          ProductDetaiilScreen.routeName:(ctx)=> ProductDetaiilScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
          OrderScreen.routeName: (ctx) => OrderScreen(),
          UserProductScreen.routename:(ctx) => UserProductScreen(),
          EditProductScreen.routeName:(ctx)=> EditProductScreen()
        },
      ),
    );
  }
}
