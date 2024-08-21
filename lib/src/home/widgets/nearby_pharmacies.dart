import 'package:docpill/commons/utils/kcolors.dart';
import 'package:docpill/commons/widgets/app_style.dart';
import 'package:docpill/src/home/widgets/header_builder.dart';
import 'package:flutter/material.dart';

import '../../../const/uidata.dart';

class NearbyPharmacies extends StatelessWidget {
  final List<PharmacyData> pharmacies;
  final VoidCallback onViewAllPressed;
  NearbyPharmacies({
    super.key,
    required this.onViewAllPressed, 
    required this.pharmacies,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderBuilder(onViewAllPressed: onViewAllPressed),
        _buildPharmaciesList(),
        //   _buildPharamciesCtegory(),
      ],
    );
  }

  Widget _buildPharmaciesList() {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: pharmacies.length,
        itemBuilder: (context, index) {
          return _buildPharmacyCard(pharmacies[index]);
        },
      ),
    );
  }

  Widget _buildPharmacyCard(PharmacyData pharmacy) {
    return Container(
      width: 200,
      margin: EdgeInsets.only(left: 16, right: 8, bottom: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Kolors.kOffWhite,
          boxShadow: [
            BoxShadow(
              color: Colors.black26.withOpacity(0.1),
              offset: Offset(0, 2),
              blurRadius: 3,
            )
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
            child: Image.network(
              pharmacy.imageUrl,
              height: 100,
              width: 200,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
             padding: const EdgeInsets.all(8.0),
             child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(pharmacy.name, style: TextStyle(fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    Icon(Icons.star, size: 16, color: Colors.amber),
                    Text(' ${pharmacy.rating} • ${pharmacy.distance}km'),
                  ]
                ),
                Row(
                  children: [
                    Icon(Icons.local_shipping, size: 16, color: Colors.green),
                    Text('Ksh${pharmacy.deliveryCharge} delivery'),
                  ],
                )
              ],
             ),
          )
        ],
      ),
    );
  }
}
