import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unimar_app_pos/models/menu_item.dart';
import 'package:unimar_app_pos/views/item_detail_page.dart';
import 'package:unimar_app_pos/views/cart_page.dart';
import 'package:unimar_app_pos/widgets/menu_item_card.dart';
import 'package:unimar_app_pos/providers/cart_provider.dart';

class RestaurantListPage extends StatelessWidget {
  final List<MenuItem> menuItems = [
    MenuItem(
      id: '1',
      name: 'X-Salada Artesanal',
      description: 'Hambúrguer de carne com queijo, alface e tomate',
      price: 24.99,
      imageUrl: 'https://moinhoglobo.com.br/wp-content/uploads/2019/05/16-hamburguer-1024x683.jpeg',
      category: 'Lanches',
    ),
    MenuItem(
      id: '2',
      name: 'Pizza Pepperoni',
      description: 'Pizza com molho de tomate, mussarela e pepperoni',
      price: 54.99,
      imageUrl: 'https://p2.trrsf.com/image/fget/cf/1200/900/middle/images.terra.com/2023/07/10/dia-da-pizza-skkhweuqjcrq.jpg',
      category: 'Pizzas',
    ),
    MenuItem(
      id: '3',
      name: 'Salada Mista',
      description: 'Misto de saladas',
      price: 19.99,
      imageUrl: 'https://www.receitasnestle.com.br/sites/default/files/srh_recipes/c0dad83734caa436a57e645aa26e9baa.jpg',
      category: 'Saladas',
    ),
    MenuItem(
      id: '4',
      name: 'Refrigerante',
      description: 'Lata 350ml',
      price: 5.00,
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTa_syL5GwO4It76oG2H9L0-Nof_9XUCtmQ0Q&s',
      category: 'Bebidas',
    ),
    MenuItem(
      id: '5',
      name: 'Água Mineral',
      description: 'Garrafa 500ml',
      price: 3.00,
      imageUrl: 'https://drogariamoderna.vtexassets.com/arquivos/ids/251997-800-auto?v=638151218022670000&width=800&height=auto&aspect=truere',
      category: 'Bebidas',
    ),
  ];

  RestaurantListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = menuItems.map((item) => item.category).toSet().toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cardápio do Restaurante'),
        actions: [
          Consumer<CartProvider>(
            builder: (_, cart, ch) => Badge(
              label: Text(cart.itemCount.toString()),
              child: ch!,
            ),
            child: IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CartPage()),
                );
              },
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          final categoryItems = menuItems.where((item) => item.category == category).toList();

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  category,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: categoryItems.length,
                itemBuilder: (context, index) {
                  return MenuItemCard(
                    menuItem: categoryItems[index],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ItemDetailPage(item: categoryItems[index]),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}