import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/product_provider.dart';
import './providers/cart_provider.dart';
import './screens/home_screen.dart';
import './screens/product_details_screen.dart';
import './screens/cart_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: MaterialApp(
        title: 'E-Commerce App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
        routes: {
          '/product-details': (ctx) => ProductDetailsScreen(),
          '/cart': (ctx) => CartScreen(),
        },
      ),
    );
  }
}
