import 'package:docpill/commons/utils/kcolors.dart';
import 'package:docpill/commons/widgets/app_style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HeaderBuilderDoctors extends StatelessWidget {
  const HeaderBuilderDoctors({
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
            'Available Doctors',
            style: appStyle(18, Kolors.kDark.withOpacity(.7), FontWeight.bold),
          ),
          TextButton(
            onPressed: () => context.go('/consultdoctor'),
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
