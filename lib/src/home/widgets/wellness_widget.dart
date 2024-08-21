import 'package:docpill/commons/utils/kcolors.dart';
import 'package:flutter/material.dart';

import '../../../const/uidata.dart';

class WellnessWidget extends StatefulWidget {
  final List<ProductData> products;
  final VoidCallback onViewAll;
  const WellnessWidget(
      {super.key, required this.products, required this.onViewAll});

  @override
  State<WellnessWidget> createState() => _WellnessWidgetState();
}
Set<int> addedToCartProducts = {};

class _WellnessWidgetState extends State<WellnessWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WellnessProductHeader(widget: widget),
        SizedBox(
          height: 16,
        ),
        _buildProductList(),
      ],
    );
  }

  Widget _buildProductList() {
    return SizedBox(
        height: 250,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.products.length,
          itemBuilder: (context, index) {
            return _buildProductCard(widget.products[index], index);
          },
        ));
  }

  Widget _buildProductCard(ProductData product, int index) {
    bool isAdded = addedToCartProducts.contains(index);
    return Container(
      width: 150, // Adjust this width as needed
      margin: EdgeInsets.only(
          left: 16, right: index == widget.products.length - 1 ? 16 : 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 180,
                decoration: BoxDecoration(
                  color: Kolors.kOffWhite.withOpacity(.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Image.asset(
                    product.imageAsset,
                    fit: BoxFit.contain,
                    height: 120,
                  ),
                ),
              ),
              Positioned(
                top: 8,
                left: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                  ),
                  child: Text(
                    product.promotion,
                    style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 4),
          Text(
            product.name,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'ksh${product.price.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              GestureDetector(
                onTap: () {
                  setState(
                    () {
                      if (isAdded) {
                        addedToCartProducts.remove(index);
                      } else {
                        addedToCartProducts.add(index);
                      }
                    },
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isAdded ? Colors.green : Colors.blue,
                  ),
                  child: Icon(
                    isAdded? Icons.check : Icons.add,
                    color: Colors.white,
                    size: 20,
                  
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class WellnessProductHeader extends StatelessWidget {
  const WellnessProductHeader({
    super.key,
    required this.widget,
  });

  final WellnessWidget widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Wellness Products',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          TextButton(
            onPressed: widget.onViewAll,
            child: Text('View All'),
            style: TextButton.styleFrom(foregroundColor: Colors.blue),
          ),
        ],
      ),
    );
  }
}
