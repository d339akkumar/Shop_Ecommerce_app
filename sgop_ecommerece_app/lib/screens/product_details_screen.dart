import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product_model.dart';
import '../providers/cart_provider.dart';

class ProductDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as Product;

    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(product.image, height: 200),
            SizedBox(height: 20),
            Text(
              product.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Category: ${product.category}',
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 10),
            Text(
              '\$${product.price}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber),
                SizedBox(width: 5),
                Text(
                  '${product.rating} (${product.count} reviews)',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(product.description),
            Spacer(),
            Consumer<CartProvider>(
              builder: (ctx, cartProvider, _) => ElevatedButton(
                onPressed: () {
                  cartProvider.addToCart(product);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${product.title} added to cart')),
                  );
                },
                child: Text('Add to Cart'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
