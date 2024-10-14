import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unimar_app_pos/views/restaurant_list_page.dart';
import 'package:unimar_app_pos/constants/app_colors.dart';
import 'package:unimar_app_pos/providers/cart_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (ctx) => CartProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unimar App Pós',
      theme: ThemeData(
        primarySwatch: AppColors.primaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: RestaurantListPage(),
    );
  }
}