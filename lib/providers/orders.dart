import 'package:flutter/foundation.dart';
import 'package:flutter_provider_udemy/providers/cart.dart';

class OrderItem {
  final String? id;
  final double? amount;
  final List<CartItem> product;
  final DateTime dateTime;

  OrderItem({
    required this.id,
    required this.amount,
    required this.product,
    required this.dateTime,
  });
}

class Orders with ChangeNotifier {
  List<OrderItem> _order = [];

  List<OrderItem> get orders {
    return [..._order];
  }

  void addOrder(List<CartItem> cartProducts, double total) {
    _order.insert(
      0,
      OrderItem(
        id: DateTime.now().toString(),
        amount: total,
        product: cartProducts,
        dateTime: DateTime.now(),
      ),
    );
    notifyListeners();
  }
}
