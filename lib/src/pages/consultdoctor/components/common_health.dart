import 'package:docpill/commons/utils/kcolors.dart';
import 'package:docpill/const/resource.dart';
import 'package:flutter/material.dart';

class CommonHealth extends StatelessWidget {
  const CommonHealth({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Common Health Issues', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _healthIssueCard('Cold & Cough', '\KSH 999.99', Kolors.kPrimaryLight, R.ASSETS_IMAGES_I1_PNG),
                _healthIssueCard('Irregular Period', '\KSH 999.99', Kolors.kGold, R.ASSETS_IMAGES_I2_PNG),
                // Add more health issue cards
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget _healthIssueCard(String title, String price, Color color, String imagePath) {
    return Card(
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text(price),
            SizedBox(height: 10), // add some space between price and image
            Image.asset(
              imagePath,
              width: 120, // adjust the width and height to your liking
              height: 120,
            ),
          ],
        ),
      ),
    );
  }
}