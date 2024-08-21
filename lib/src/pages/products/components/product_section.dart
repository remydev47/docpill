import 'package:docpill/commons/utils/kcolors.dart';
import 'package:docpill/commons/widgets/app_style.dart';
import 'package:docpill/const/resource.dart';
import 'package:docpill/const/uidata.dart';
import 'package:flutter/material.dart';

import '../widgets/product-card.dart';

class ProductSection extends StatelessWidget {
  final List <Product> products =[
    Product(
      name: 'Anti Bacterial Liquid',
      imageUrl: R.ASSETS_IMAGES_P4_PNG,
      originalPrice: 640.9,
      price: 700.1,
      nearbyPharmacies: [
         Pharmacy(
          name: 'Good life',
          arrivalTime: '30 minutes',
          price: 19.99,
          deliveryInfo: 'Free delivery',
        ),
        Pharmacy(
          name: 'Herbalife',
          arrivalTime: '40 minutes',
          price: 22.99,
          deliveryInfo: 'Free delivery',
        ),
        Pharmacy(
          name: 'Tanmin',
          arrivalTime: '10 minutes',
          price: 10.99,
          deliveryInfo: 'Free delivery',
        ),
      ],
      discount: 15, id: '',
    ),
    Product(
      name: 'Vitamin B12',
      imageUrl: R.ASSETS_IMAGES_P3_PNG,
      originalPrice: 90.9,
      price: 70.1,
      nearbyPharmacies: [
        Pharmacy(
          name: 'Well Being',
          arrivalTime: '30 minutes',
          price: 19.99,
          deliveryInfo: 'Free delivery',
        ),
        Pharmacy(
          name: 'GoodLife',
          arrivalTime: '30 minutes',
          price: 19.99,
          deliveryInfo: 'Free delivery',
        ),
      ],
      discount: 25, id: '',
    ),
    Product(
      name: 'Nitrile Dsposable Gloves',
      imageUrl: R.ASSETS_IMAGES_P2_PNG,
      originalPrice: 99.9,
      price: 70.1,
      nearbyPharmacies: [
        Pharmacy(
          name: 'Well Being',
          arrivalTime: '30 minutes',
          price: 19.99,
          deliveryInfo: 'Free delivery',
        ),
        Pharmacy(
          name: 'GoodLife',
          arrivalTime: '30 minutes',
          price: 19.99,
          deliveryInfo: 'Free delivery',
        ),
      ],
      discount: 20, id: '',
    ),
    Product(
      name: 'Garnier ',
      imageUrl: R.ASSETS_IMAGES_P5_PNG,
      originalPrice: 99.9,
      price: 70.1,
      nearbyPharmacies: [
        Pharmacy(
          name: 'Good life',
          arrivalTime: '30 minutes',
          price: 19.99,
          deliveryInfo: 'Free delivery',
        ),
        Pharmacy(
          name: 'Herbalife',
          arrivalTime: '40 minutes',
          price: 22.99,
          deliveryInfo: 'Free delivery',
        ),
        Pharmacy(
          name: 'Tanmin',
          arrivalTime: '10 minutes',
          price: 10.99,
          deliveryInfo: 'Free delivery',
        ),
      ],
      discount: 25, id: '',
    ),
    Product(
      name: 'Dietry Suppliment',
      imageUrl: R.ASSETS_IMAGES_P1_PNG,
      originalPrice: 349.9,
      price: 320.1,
      nearbyPharmacies: [
        Pharmacy(
          name: 'Good life',
          arrivalTime: '30 minutes',
          price: 19.99,
          deliveryInfo: 'Free delivery',
        ),
        Pharmacy(
          name: 'Herbalife',
          arrivalTime: '40 minutes',
          price: 22.99,
          deliveryInfo: 'Free delivery',
        ),
        Pharmacy(
          name: 'Tanmin',
          arrivalTime: '10 minutes',
          price: 10.99,
          deliveryInfo: 'Free delivery',
        ),
      ],
      discount: 25, id: '',
    ),
    
  ];
   ProductSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Wellness Products',
                style: appStyle(
                  18,
                  Kolors.kDark,
                  FontWeight.bold,
                ),
              ),
              Text(
                'View All',
                style: TextStyle(color: Colors.blue),
              ),
            ],
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: products.length,//assume you have a list of products
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => showProductDialog(context, products[index]),
              child: _buildProductCard(products[index]),
            );
          },
        ),
      ],
    );
  }
}

Widget _buildProductCard(Product product) {
  return Card(
    elevation: 2,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Image.asset(
              product.imageUrl,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Positioned(
              top: 8,
              left: 8,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '${product.discount}% OFF',
                  style: appStyle(
                    10,
                    Kolors.kOffWhite,
                    FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
        Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: appStyle(
                    14,
                    Kolors.kDark,
                    FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '\ksh${product.price.toStringAsFixed(2)}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.blue),
                        ),
                        Text(
                          '\ksh${product.originalPrice.toStringAsFixed(2)}',
                          style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        )
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: Colors.blue, shape: BoxShape.circle),
                      child: Icon(Icons.add, color: Colors.white, size: 20),
                    )
                  ],
                )
              ],
            )),
      ],
    ),
  );
}


