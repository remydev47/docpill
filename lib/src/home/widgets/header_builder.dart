
import 'package:docpill/commons/utils/kcolors.dart';
import 'package:docpill/commons/widgets/app_style.dart';
import 'package:flutter/material.dart';

class HeaderBuilder extends StatelessWidget {
  const HeaderBuilder({
    super.key,
    required this.onViewAllPressed,
  });

  final VoidCallback onViewAllPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Nearby Pharmacies',
            style: appStyle(18, Kolors.kDark.withOpacity(.7), FontWeight.bold),
          ),
          TextButton(
            onPressed: onViewAllPressed,
            child: Text(
              'View All',
              style: appStyle(15, Kolors.kPrimaryLight, FontWeight.normal),
            ),
          ),
        ],
      ),
    );
  }
}
