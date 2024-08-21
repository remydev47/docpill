import 'package:docpill/commons/widgets/custom_app_bar.dart';
import 'package:docpill/const/resource.dart';
import 'package:docpill/const/uidata.dart';
import 'package:docpill/src/home/widgets/advertise_slider.dart';
import 'package:docpill/src/home/widgets/available_doctors.dart';
import 'package:docpill/src/home/widgets/diagnostic_widget.dart';
import 'package:docpill/src/home/widgets/home_slider.dart';
import 'package:docpill/src/home/widgets/nearby_pharmacies.dart';
import 'package:docpill/src/home/widgets/wellness_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class Homescreen extends StatelessWidget {
  //final ScrollController scrollController;
  const Homescreen({super.key, });

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: PreferredSize(
        preferredSize: Size.fromHeight(110),
        child: CustomAppBar(),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 16.h,
          ),
          HomeBentoui(),
          SizedBox(
            height: 10.h,
          ),
          NearbyPharmacies(
            pharmacies: [
              PharmacyData(
                name: 'Tamana Pharmacy',
                imageUrl:
                    'https://img.freepik.com/free-photo/empty-drugstore-with-bottles-packages-full-with-medicaments-retail-shop-shelves-with-pharmaceutical-products-pharmacy-space-filled-with-medical-drugs-pills-vitamins-boxes_482257-62215.jpg?t=st=1723638524~exp=1723642124~hmac=911225269f99a979cd47181f00e8200c0638da0c296303d7e5085f9a5ac58dc8&w=1800',
                rating: 4.5,
                distance: 1.2,
                deliveryCharge: 20,
              ),
              PharmacyData(
                name: 'WellBeing Pharmacy',
                imageUrl:
                    'https://img.freepik.com/free-photo/store-basket-filled-with-pharmaceutics-pills-ready-be-buy-by-clients-checkup-visit-drugstore-pharmacy-also-carried-variety-other-medical-products-bandages-cold-medicine_482257-65940.jpg?t=st=1723639413~exp=1723643013~hmac=d09edcadac33a4cbd1904aa28f498fab36d57e057c4745027f19866667bf8cad&w=1800',
                rating: 4.5,
                distance: 1.2,
                deliveryCharge: 20,
              ),
              PharmacyData(
                name: 'Fit and Fresh Pharmacy',
                imageUrl:
                    'https://img.freepik.com/free-photo/portrait-woman-working-pharmaceutical-industry_23-2151684892.jpg?t=st=1723639498~exp=1723643098~hmac=971f46806592fc35070abba4ee1cff0cde5c9de299beef5b7e8e93f10caf1839&w=1800',
                rating: 4.5,
                distance: 1.2,
                deliveryCharge: 20,
              ),
            ],
            onViewAllPressed: () {
              context.go('');
            },
          ),
          SizedBox(
            height: 10.h,
          ),
          AvailableDoctors(
            onViewAllPressed: () {
              context.go('location');
            },
            doctors: [
              DoctorData(
                name: 'Asman Khan',
                imageUrl: R.ASSETS_IMAGES_DOC1_PNG,
                specialty: 'Pedestrian',
                hospital: 'Agha Khan Hospital',
                rating: 4.8,
                yearsOfExperience: 7,
              ),
              DoctorData(
                name: 'Salina Zaman',
                imageUrl: R.ASSETS_IMAGES_DOC2_PNG,
                specialty: 'Physician',
                hospital: 'BridgeView',
                rating: 4.8,
                yearsOfExperience: 5,
              ),
              DoctorData(
                name: 'Serena Gome',
                imageUrl: R.ASSETS_IMAGES_DOC3_PNG,
                specialty: 'Optician',
                hospital: 'AAR',
                rating: 4.8,
                yearsOfExperience: 8,
              ),
              DoctorData(
                name: 'Mesuda Khan',
                imageUrl: R.ASSETS_IMAGES_DOC4_PNG,
                specialty: 'General Physician',
                hospital: 'Sutherland',
                rating: 4.8,
                yearsOfExperience: 10,
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          AdvertiseSlider(
            onOrderNow: () {},
          ),
          SizedBox(
            height: 10.h,
          ),
          DiagnosticWidget(
            onBookNow: () {
              context.go('booking');
            },
            testkits: [
              TestkitData(
                image: R.ASSETS_IMAGES_DIG1_PNG,
                name: 'Covid RT-PCR',
                description:
                    'Known Us covid 19 virus \n Qualitative per throat swap',
                price: 3000,
              ),
              TestkitData(
                image: R.ASSETS_IMAGES_DIG2_PNG,
                name: 'Cancer CheckUp',
                description:
                    'Known Us covid 19 virus \n Qualitative per throat swap',
                price: 10178,
              ),
              TestkitData(
                image: R.ASSETS_IMAGES_DIG3_PNG,
                name: 'Pregnancy Checkup',
                description:
                    'For the Moms your Health and that of you baby Matters',
                price: 10154,
              )
            ],
          ),
          SizedBox(
            height: 8.h,
          ),
          WellnessWidget(
            products: [
              ProductData(
                name: 'Dietry Suppliment',
                imageAsset: R.ASSETS_IMAGES_P1_PNG,
                price: 348,
                promotion: '25% Off',
              ),
              ProductData(
                name: 'Nitrile Disposable',
                imageAsset: R.ASSETS_IMAGES_P2_PNG,
                price: 140,
                promotion: '20% Off',
              ),
              ProductData(
                name: 'Vitamin B12',
                imageAsset: R.ASSETS_IMAGES_P3_PNG,
                price: 80,
                promotion: '10% Off',
              ),
              ProductData(
                name: 'Antibacterial Liquid',
                imageAsset: R.ASSETS_IMAGES_P4_PNG,
                price: 640,
                promotion: '25% Off',
              ),
            ],
            onViewAll: () {
              
              context.go('/productspage');
            },
          )
        ],
      ),
    );
  }
}
