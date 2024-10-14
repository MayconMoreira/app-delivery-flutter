import 'package:unimar_app_pos/models/menu_item.dart';

class CartItem {
  final String id;
  final MenuItem menuItem;
  int quantity;

  CartItem({
    required this.id,
    required this.menuItem,
    this.quantity = 1,
  });

  String get name => menuItem.name;
  double get price => menuItem.price;
  double get totalPrice => price * quantity;
}