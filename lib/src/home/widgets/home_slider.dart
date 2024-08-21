import 'package:docpill/commons/utils/kcolors.dart';
import 'package:docpill/const/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeBentoui extends StatelessWidget {
  const HomeBentoui({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Container(
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                promoCard(
                  image: R.ASSETS_IMAGES_BENTO2_PNG,
                  title: 'Diagnostic',
                  subTitle: 'Book Tests and Checkups',
                ), //provide the image card
                promoCard(
                    image: R.ASSETS_IMAGES_BENTO3_PNG,
                    title: 'Prescription',
                    subTitle:
                        'Order via Prescription'), //provide the image card
                promoCard(
                    image: R.ASSETS_IMAGES_BENTO4_PNG,
                    title: 'Pharma',
                    subTitle: 'Medicines and Health'),
              ],
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Container(
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.amber,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                    R.ASSETS_IMAGES_ADIMAGE1_PNG), //provide an AssetImage
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  stops: [0.1, 0.9],
                  colors: [
                    Kolors.kDark.withOpacity(0.8),
                    Kolors.kDark.withOpacity(.1),
                  ],
                ),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      // Text(
                      //   'Consult Doctors',
                      //   style: TextStyle(
                      //     color: Kolors.kWhite,
                      //     fontSize: 20,
                      //     fontWeight: FontWeight.bold,
                      //   ),
                      // ),
                      // Text(
                      //   'Get Expert Advice from \n specialist Doctors',
                      //   style: TextStyle(
                      //     color: Kolors.kOffWhite,
                      //     fontSize: 20,
                      //     fontWeight: FontWeight.normal,
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget promoCard({
    image,
    required String title,
    required String subTitle,
  }) {
    return AspectRatio(
      aspectRatio: 2.2 / 3,
      child: Container(
        margin: EdgeInsets.only(right: 15.0),
        decoration: BoxDecoration(
          color: Kolors.kOrange,
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage(image),
          ),
        ),
        child: Container(
          alignment: Alignment.bottomLeft,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(image), //provide an AssetImage
            ),
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              stops: [0.1, 0.9],
              colors: [
                Colors.white.withOpacity(0.8),
                Kolors.kWhite.withOpacity(.1),
              ],
            ),
          ),
          child: Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Kolors.kDark,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    subTitle,
                    style: TextStyle(
                      color: Kolors.kOffWhite,
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
