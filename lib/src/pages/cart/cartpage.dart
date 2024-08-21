import 'package:docpill/commons/utils/kcolors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'services/cart_services.dart';

class CartPage extends StatefulWidget {
  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _cartAppBar(),
      body: Consumer<CartService>(
        builder: (context, cartService, child) {
          return Column(
            children: [
              Expanded(child: _buildCartList(context, cartService)),
              _buildCheckoutBar(context, cartService),
            ],
          );
        },
      ),
    );
  }

  Widget _buildCartList(BuildContext context, CartService cartService) {
    List<CartItem> cartItems = cartService.items;

    if (cartItems.isEmpty) {
      return Center(
          child: Text('Your cart is empty', style: TextStyle(fontSize: 18)));
    }

    return ListView.builder(
      itemCount: cartItems.length,
      itemBuilder: (context, index) {
        CartItem item = cartItems[index];
        return Card(
          margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                // Product Image
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(item.product.imageUrl),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                SizedBox(width: 16),
                // Product Details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item.product.name,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      SizedBox(height: 4),
                      Text('\ksh${item.product.price.toStringAsFixed(2)}',
                          style: TextStyle(color: Colors.blue)),
                    ],
                  ),
                ),
                // Quantity Controls
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove_circle_outline),
                      onPressed: () => cartService.updateItemQuantity(
                          item.product, item.quantity - 1),
                    ),
                    Text('${item.quantity}', style: TextStyle(fontSize: 16)),
                    IconButton(
                      icon: Icon(Icons.add_circle_outline),
                      onPressed: () => cartService.updateItemQuantity(
                          item.product, item.quantity + 1),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildCheckoutBar(BuildContext context, CartService cartService) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total:', style: TextStyle(fontSize: 18)),
              Text(
                '\ksh${cartService.totalPrice.toStringAsFixed(2)}',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
            ],
          ),
          SizedBox(height: 16),
          ElevatedButton(
            child: Text('Proceed to Checkout', style: TextStyle(fontSize: 18, color: Kolors.kOffWhite)),
            style: ElevatedButton.styleFrom(
               backgroundColor: Kolors.kPrimary,
              padding: EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () => _checkout(context, cartService),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _cartAppBar() {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () => context.go('/productspage'),
      ),
      title:  Text('My Cart'),
    );
  }

  void _checkout(BuildContext context, CartService cartService) {
    // Implement checkout logic here
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Checkout'),
          content: Text(
              'Total amount: \ksh${cartService.totalPrice.toStringAsFixed(2)}\n\nProceed with payment?'),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            ElevatedButton(
              child: Text('Confirm'),
              onPressed: () => context.go('/orderconfirmation')
            ),
          ],
        );
      },
    );
  }
}


