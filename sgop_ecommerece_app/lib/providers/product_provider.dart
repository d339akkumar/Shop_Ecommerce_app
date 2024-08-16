import 'package:flutter/material.dart';
import '../models/product_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];

  List<Product> get products => _products;

  Future<void> fetchProducts() async {
    const url = 'https://fakestoreapi.com/products';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        _products = data.map((json) => Product.fromJson(json)).toList();
        notifyListeners();
      }
    } catch (error) {
      throw error;
    }
  }
}
