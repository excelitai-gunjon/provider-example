import 'package:flutter/material.dart';
import 'package:flutter_provider_udemy/providers/products.dart';
import 'package:flutter_provider_udemy/screens/edit_product_screen.dart';
import 'package:provider/provider.dart';

class UserProductItem extends StatelessWidget {
  //const UserProductItem({Key? key}) : super(key: key);

  final String? title;
  final String? imageURL;
  final String? id;

  UserProductItem(this.title,this.imageURL,this.id);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title.toString()),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(
            imageURL.toString()),
      ),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(EditProductScreen.routeName, arguments: id);
              },
              icon: Icon(Icons.edit),
              color: Theme.of(context).primaryColor,
            ),
            IconButton(
              onPressed: (){
                Provider.of<Products>(context, listen: false).deleteProduct(id!);
              },
              icon: Icon(Icons.delete),
              color: Colors.deepOrangeAccent,
            ),
          ],
        ),
      ),
    );
  }
}
