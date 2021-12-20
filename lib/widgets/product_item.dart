import 'package:flutter/material.dart';
//import 'package:flutter_beep/flutter_beep.dart';
import 'package:flutter_provider_udemy/providers/cart.dart';
import 'package:flutter_provider_udemy/providers/product.dart';
import 'package:flutter_provider_udemy/screens/product_detail_Screen.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            //FlutterBeep.beep();
            Navigator.of(context).pushNamed(
              ProductDetaiilScreen.routeName,
              arguments: product.id,
            );
          },
          child: Image.network(
            product.imageUrl!,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<Product>(
            builder: (ctx, product, _) => IconButton(
              icon: Icon(
                product.isFavorite ? Icons.favorite : Icons.favorite_border,
              ),
              color: Theme.of(context).accentColor,
              onPressed: () {
                //FlutterBeep.beep();
                product.toggleFavoriteStatus();
              },
            ),
          ),
          title: Text(
            product.title!,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {
              // cart.addItem(product.id, product.price, product.title);
              // Scaffold.of(context).hideCurrentSnackBar();
              // Scaffold.of(context).showSnackBar(
              //   SnackBar(
              //     content: Text(
              //       'Added item to cart!',
              //     ),
              //     duration: Duration(seconds: 2),
              //     action: SnackBarAction(
              //       label: 'UNDO',
              //       onPressed: () {
              //         cart.removeSingleItem(product.id);
              //       },
              //     ),
              //   ),
              // );
              //FlutterBeep.playSysSound(41);
              cart.addItem(product.id!, product.price!, product.title!);
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Added item to cart!',
                  ),
                  duration: Duration(seconds: 2),
                  backgroundColor: Colors.grey,
                  action: SnackBarAction(
                    label: 'UNDO',
                    onPressed: () {
                      cart.removeSingleItem(product.id!);
                    },
                  ),
                ),
              );
            },
            color: Theme.of(context).accentColor,
          ),
        ),
      ),
    );
  }
}
