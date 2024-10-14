import 'package:flutter/material.dart';
import 'package:unimar_app_pos/models/menu_item.dart';

class MenuItemCard extends StatelessWidget {
  final MenuItem menuItem;
  final VoidCallback onTap;

  const MenuItemCard({Key? key, required this.menuItem, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        leading: Image.network(menuItem.imageUrl, width: 50, height: 50, fit: BoxFit.cover),
        title: Text(menuItem.name),
        subtitle: Text('R\$ ${menuItem.price.toStringAsFixed(2)}'),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ),
    );
  }
}