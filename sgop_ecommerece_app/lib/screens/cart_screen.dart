import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: cartProvider.cartItems.isEmpty
          ? Center(child: Text('Your cart is empty'))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartProvider.cartItems.length,
                    itemBuilder: (ctx, i) {
                      final product = cartProvider.cartItems.values.toList()[i];
                      return ListTile(
                        leading: Image.network(product.image, width: 50),
                        title: Text(product.title),
                        subtitle: Text('\$${product.price}'),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            cartProvider.removeFromCart(product.id);
                          },
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Total: \$${cartProvider.totalPrice}',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    cartProvider.clearCart();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Order placed!')),
                    );
                  },
                  child: Text('Checkout'),
                ),
              ],
            ),
    );
  }
}
