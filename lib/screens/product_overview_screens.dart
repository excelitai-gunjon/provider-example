import 'package:flutter/material.dart';
import 'package:flutter_provider_udemy/providers/home_state.dart';
import 'package:flutter_provider_udemy/screens/cart_screen.dart';
import 'package:flutter_provider_udemy/widgets/app_drawer.dart';
import 'package:flutter_provider_udemy/widgets/products_grid.dart';
import 'package:provider/provider.dart';
//import 'package:flutter_beep/flutter_beep.dart';

import 'package:flutter_provider_udemy/providers/cart.dart';
import 'package:flutter_provider_udemy/widgets/badge.dart';

// enum FilterOptions{
//   Favorites,
//   All,
// }
class ProductsOverviewScreen extends StatelessWidget {
  const ProductsOverviewScreen({Key? key}) : super(key: key);
  //var _showOnlyFavorites = false;
  @override
  Widget build(BuildContext context) {
    final _show=Provider.of<HomeState>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
        actions: [
          PopupMenuButton(
            onSelected: (selectedValue) {
              // setState(() {
              //   if (selectedValue == FilterOptions.Favorites) {
              //     FlutterBeep.beep();
              //     _showOnlyFavorites = true;
              //   } else {
              //     FlutterBeep.beep();
              //     _showOnlyFavorites = false;
              //   }
              // });
              _show.changeState(selectedValue);
              print(selectedValue.toString());
              print(_show.homeSate.toString());
            },
            icon: Icon(
              Icons.more_vert,
            ),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Only Favorites'),
                value: _show.favorites,
                //FilterOptions.Favorites,
              ),
              PopupMenuItem(
                child: Text("Show All"),
                value: _show.all,
                //FilterOptions.All,
              ),
            ],
          ),
          Consumer<Cart>(
            builder: (_, cart, ch) => Badge(
              child: ch!,
              value: cart.itemCount.toString(),
            ),
            child: IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Theme.of(context).secondaryHeaderColor,
              ),
              onPressed: () {
                //FlutterBeep.beep();
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          ),
        ],
      ),
       drawer: AppDrawer(),
      body: ProductsGrid(_show.homeSate),
    );
  }
}
