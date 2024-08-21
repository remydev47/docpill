import 'package:docpill/commons/utils/kcolors.dart';
import 'package:docpill/const/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdvertiseSlider extends StatelessWidget {
  final VoidCallback onOrderNow;
  const AdvertiseSlider({super.key, required this.onOrderNow});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildAdCard(),
        ],
      ),
    );
  }

  Widget _buildAdCard() {
    return Container(
      width: 400, // Adjust this width as needed
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Kolors.kPrimaryLight.withOpacity(.14),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '25% OFF',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade900,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    '10% Cashback',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Kolors.kDark,
                    ),
                  ),
                  SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: onOrderNow,
                    child: Text('Order Now'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Kolors.kOffWhite,
                      backgroundColor: Kolors.kPrimary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Image.asset(
            R.ASSETS_IMAGES_ADIMAGE_PNG,
            fit: BoxFit.cover,
            height: 200, // Adjust this height as needed
          )
        ],
      ),
    );
  }
}
