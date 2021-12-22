import 'package:flutter/material.dart';

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
              onPressed: () {},
              icon: Icon(Icons.edit),
              color: Theme.of(context).primaryColor,
            ),
            IconButton(
              onPressed: (){

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
