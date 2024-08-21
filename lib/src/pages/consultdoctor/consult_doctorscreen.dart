import 'package:docpill/const/resource.dart';
import 'package:docpill/const/uidata.dart';
import 'package:docpill/src/home/widgets/available_doctors.dart';
import 'package:docpill/src/pages/consultdoctor/components/common_health.dart';
import 'package:docpill/src/pages/consultdoctor/components/doctors_list.dart';
import 'package:docpill/src/pages/consultdoctor/components/medical_specility.dart';
import 'package:docpill/src/pages/consultdoctor/components/promobanner.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ConsultDoctorscreen extends StatelessWidget {
  const ConsultDoctorscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => context.go('/home'),
        ),
        title: Text('Consult a Doctor'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Promobanner(
              onOrderNow: () {},
            ),
            MedicalSpecility(),
            SizedBox(
              height: 10,
            ),
            CommonHealth(),
            SizedBox(
              height: 10,
            ),
            DoctorsList(
               onViewAllPressed: () {
                context.go('/bookdoctor');
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
          ],
        ),
      ),
    );
  }
}
