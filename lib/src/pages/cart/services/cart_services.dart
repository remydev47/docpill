import 'package:docpill/const/uidata.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class CartItem {
  final Product product;
  int quantity;
  CartItem({required this.product, required this.quantity });
}

class CartService extends ChangeNotifier {
  // Singleton instance
  static final CartService _instance = CartService._internal();

  factory CartService() {
    return _instance;
  }

  void updateItemQuantity(Product product, int newQuantity) {
    int index = _items.indexWhere((item) => item.product.id == product.id);
    if (index != -1) {
      if (newQuantity > 0) {
        _items[index].quantity = newQuantity;
      } else {
        _items.removeAt(index);
      }
      notifyListeners();
    }
  }

  CartService._internal();

  // List to store cart items
  final List<CartItem> _items = [];

  // Get all items in the cart
  List<CartItem> get items => _items;

  // Add an item to the cart
  void addItem(Product product, int quantity) {
    // Check if the product is already in the cart
    int index = _items.indexWhere((item) => item.product.id == product.id);
    if (index != -1) {
      // If the product is already in the cart, update the quantity
      _items[index].quantity += quantity;
    } else {
      // If it's a new product, add it to the cart
      _items.add(CartItem(product: product, quantity: quantity));
    }
    // Notify listeners that the cart has changed
    notifyListeners();
  }

  // Remove an item from the cart
  void removeItem(Product product) {
    _items.removeWhere((item) => item.product.id == product.id);
    notifyListeners();
  }

  // Clear the cart
  void clear() {
    _items.clear();
    notifyListeners();
  }

  // Calculate the total price of the cart
  double get totalPrice {
    return _items.fold(0,
        (total, current) => total + (current.product.price * current.quantity));
  }

  // Notify listeners (you'll need to implement this based on your state management solution)
  void notifyListeners() {
    // This is where you'd notify any listeners that the cart has changed
    // If you're using Provider, you might call notifyListeners() here
    // If you're using Riverpod, you might use a StateNotifier
    // For now, we'll just print a message
    print(
        'Cart updated: ${_items.length} items, total: \$${totalPrice.toStringAsFixed(2)}');
  }

  
}


