import 'package:docpill/commons/utils/kcolors.dart';
import 'package:docpill/commons/widgets/app_style.dart';
import 'package:docpill/const/resource.dart';
import 'package:flutter/material.dart';

class MedicalSpecility extends StatelessWidget {
  List<Map<String,dynamic>> specialities = [
    {
      'name': 'Women\'s Health',
      'image': R.ASSETS_IMAGES_S7_PNG,
      'route': '',
    },
    {
      'name': 'Skincare & Health',
      'image': R.ASSETS_IMAGES_S6_PNG,
      'route': '',
    },
    {
      'name': 'Child Specialist',
      'image': R.ASSETS_IMAGES_S5_PNG,
      'route': '',
    },
    {
      'name': 'General Physician',
      'image': R.ASSETS_IMAGES_S4_PNG,
      'route': '',
    },
    {
      'name': 'Sexology',
      'image': R.ASSETS_IMAGES_S3_PNG,
      'route': '',
    },
    {
      'name': 'Digestion',
      'image': R.ASSETS_IMAGES_S2_PNG,
      'route': '',
    },
    {
      'name': 'Psychiatry',
      'image': R.ASSETS_IMAGES_S1_PNG,
      'route': '',
    },
  ];
  // 'Women\'s Health',
  //   'Skin & Hair',
  //   'Child Specialist',
  //   'General Physician',
  //   'Sexology',
  //   'Digestion',
  //   'Psychiatry'
  MedicalSpecility({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Medical Specialities',
            style: appStyle(18, Kolors.kDark, FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 1,
            ),
            itemCount: specialities.length,
            itemBuilder: (context, index) {
              return _specialtyButton(
                specialities[index]['name']!,
                specialities[index]['image']!,
                specialities[index]['route']!,
              );
            },
          ),
        ],
      ),
    );
  }
  Widget _specialtyButton(String name, String imagePath, String route) {
    return InkWell(
      onTap: (){},
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(imagePath),
          ),
          SizedBox(height: 5,),
          Text(name, textAlign: TextAlign.center, style: appStyle(12, Kolors.kDark, FontWeight.w400),)
        ],
      ),
    );
  }
}
