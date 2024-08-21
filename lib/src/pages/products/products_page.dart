import 'package:docpill/commons/utils/kcolors.dart';
import 'package:docpill/src/pages/cart/product_adbanner.dart';
import 'package:docpill/src/pages/products/components/product_section.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../const/resource.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  bool _isSearching = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _productAppBar(),
        body: ListView(
          children: [
            ProductAdbanner(
              onOrderNow: () {},
            ),
            SizedBox(
              height: 10,
            ),
            _medicineHeader(),
            _buildCategoryGrid(),
            SizedBox(
              height: 10,
            ),
            
            SizedBox(
              height: 10,
            ),
            ProductSection()
            
          ],
        ));
  }



  Widget _medicineHeader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          SizedBox(width: 8.0),
          Text(
            'Medicine & Health Products',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }


  PreferredSizeWidget _productAppBar() {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () => context.go('/home'),
      ),
      title: _isSearching
          ? TextField(
              decoration: InputDecoration(
                hintText: 'Search Medicine....',
                border: InputBorder.none,
              ),
              autofocus: true,
            )
          : Text('Medicine'),
      actions: [
        IconButton(
          icon: Icon(_isSearching ? Icons.close : Icons.search),
          onPressed: () {
            setState(() {
              _isSearching = !_isSearching;
            });
          },
        ),
        IconButton(
          icon: Badge(
            child: Icon(Icons.shopping_cart),
            label: Text('2'),
          ),
          onPressed: () => context.go('/cart'),
        ),
      ],
    );
  }

  Widget _buildCategoryGrid() {
    List<Map<String, dynamic>> categories = [
      {
        'name': 'Baby Care',
        'route': '/products/baby-care',
        'color': Colors.blue[100]!,
        'image': R.ASSETS_IMAGES_M1_PNG
      },
      {
        'name': 'Sexual Medicine',
        'route': '/products/sexual-medicine',
        'color': Kolors.kSecondaryLight!,
        'image': R.ASSETS_IMAGES_M2_PNG
      },
      {
        'name': 'Alternative \n Medicine',
        'route': '/products/alternative-medicine',
        'color': Colors.green[100]!,
        'image': R.ASSETS_IMAGES_M3_PNG
      },
      {
        'name': 'Fitness',
        'route': '/products/beauty',
        'color': Colors.purple[100]!,
        'image': R.ASSETS_IMAGES_M4_PNG
      },
      // {
      //   'name': 'Supplements',
      //   'route': '/products/supplements',
      //   'color': Colors.orange[100]!,
      //   'image': 'assets/supplements.png'
      // },
      // {
      //   'name': 'More',
      //   'route': '/products/more',
      //   'color': Colors.teal[100]!,
      //   'image': 'assets/more.png'
      // },
    ];
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return _categoryButton(
          categories[index]['name']!,
          categories[index]['route']!,
          categories[index]['color']!,
          categories[index]['image']!,
        );
      },
    );
  }

  Widget _categoryButton(
    String name,
    String route,
    Color color,
    String imagePath,
  ) {
    return InkWell(
      onTap: () => context.go(route),
      child: Container(
        height: 30,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 16,
              top: 0,
              bottom: 0,
              child: Center(
                child: Text(
                  name,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Kolors.kDark.withOpacity(.7),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 8,
              top: 8,
              bottom: 8,
              child: Image.asset(
                imagePath,
                width: 60,
                fit: BoxFit.contain,
              ),
            )
          ],
        ),
      ),
    );
  }
}


