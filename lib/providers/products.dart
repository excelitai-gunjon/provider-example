import 'package:flutter/material.dart';
import 'package:flutter_provider_udemy/providers/product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
      'https://i.pinimg.com/originals/b0/3c/27/b03c2754ebe2d28db38df159f9e3bdc6.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
      'https://5.imimg.com/data5/IK/UV/KH/SELLER-33408751/cotton-trouser-500x500.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
      'https://ae01.alicdn.com/kf/HTB1uxBhXinrK1RjSsziq6xptpXaA/FS-Autumn-Winter-Yellow-Plaid-Scarf-Women-Cashmere-Scarves-Large-Long-Blanket-Warm-Shawls-And-Wraps.jpg',
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
      'https://m.media-amazon.com/images/I/31jDc-MRByL._AC_.jpg',
    ),
    Product(
      id: 'p5',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
      'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),
    Product(
      id: 'p6',
      title: 'Lightweight Check Cashmere Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
      "https://assets.burberry.com/is/image/Burberryltd/52512496d7039d18739b05d56d77cf572f0a8a69.jpg?\$BBY_V2_ML_1x1\$&wid=2500&hei=2500",
    ),
    Product(
      id: 'p7',
      title: 'blue Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
      'https://i.pinimg.com/474x/0b/1d/bc/0b1dbc4aaaf7bc592325a70affe8b3ba.jpg',
    ),
  ];

  List<Product> get items{
    return [..._items];
  }

  List<Product> get favoriteItems{
    return _items.where((prodItem) => prodItem.isFavorite).toList();
  }

  Product findById(String id){
    return _items.firstWhere((prod) => prod.id==id);
  }

  void addProduct(){
    notifyListeners();
  }

}
