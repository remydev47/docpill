import 'package:docpill/commons/utils/kcolors.dart';
import 'package:docpill/src/pages/cart/services/cart_services.dart';
import 'package:flutter/material.dart';

import '../../../../const/uidata.dart';

void showProductDialog(BuildContext context, Product product) {

  int quantity = 1;
   
  showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          void _decreaseQuantity() {
            setState(() {
              if (quantity > 1) quantity--;
            });
          }

          void _increaseQuantity() {
            setState(() {
              quantity++;
            });
          }

          void _addToCart() {
            CartService().addItem(product, quantity);
            //CartService.addItem(product, quantity);
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Kolors.kGold,
                content: Text('Added ${quantity} ${product.name} to Cart', style: TextStyle(color: Colors.black38, fontWeight: FontWeight.normal),),
                behavior: SnackBarBehavior.floating,
                elevation: 10,
              ),
            );
          }

          return Dialog(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    product.imageUrl,
                    height: 120,
                    width: double.infinity,
                    fit: BoxFit.contain,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '\ksh${product.price.toStringAsFixed(2)}',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            ),
                            Text(
                              '\ksh${product.originalPrice.toStringAsFixed(2)}',
                              style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Text('Quantity: '),
                            IconButton(
                              icon: Icon(Icons.remove),
                              onPressed:
                                  // Implement decrease quantity
                                  _decreaseQuantity,
                            ),
                            Text('$quantity'),
                            IconButton(
                              icon: Icon(Icons.add),
                              onPressed: _increaseQuantity,
                            ),
                            Spacer(),
                            ElevatedButton(
                              child: Text('Add'),
                              onPressed: _addToCart,
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        Row(
                          children: [
                            Icon(Icons.location_on, color: Colors.red),
                            SizedBox(width: 8),
                            Text('Near by Pharmacy',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                        SizedBox(height: 8),
                        ...product.nearbyPharmacies
                            .map((pharmacy) => Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(pharmacy.name),
                                          Text(
                                              'Arrives: ${pharmacy.arrivalTime}',
                                              style: TextStyle(
                                                  color: Colors.grey)),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                              '\ksh${pharmacy.price.toStringAsFixed(2)}',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          Text(pharmacy.deliveryInfo,
                                              style: TextStyle(
                                                  color: pharmacy.deliveryInfo
                                                          .contains('Free')
                                                      ? Colors.green
                                                      : Colors.grey)),
                                        ],
                                      ),
                                    ],
                                  ),
                                ))
                            .toList(),
                          
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
