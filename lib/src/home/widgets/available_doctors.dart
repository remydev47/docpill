import 'package:docpill/commons/utils/kcolors.dart';
import 'package:docpill/commons/widgets/app_style.dart';
import 'package:docpill/const/uidata.dart';
import 'package:docpill/src/home/widgets/header_builder_doctors.dart';
import 'package:flutter/material.dart';

class AvailableDoctors extends StatelessWidget {
  final List<DoctorData> doctors;
  final VoidCallback onViewAllPressed;
  AvailableDoctors({
    super.key,
    required this.onViewAllPressed,
    required this.doctors,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeaderBuilderDoctors(
          onViewAllPressed: onViewAllPressed,
        ),
        SizedBox(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            // shrinkWrap: true,
            // physics: NeverScrollableScrollPhysics(),
            itemCount: doctors.length,
            itemBuilder: (context, index) {
              return _buildDoctorCard(doctors[index]);
            },
          ),
        )
      ],
    );
  }

  Widget _buildDoctorCard(DoctorData doctor) {
    return Container(
      width: 300,
      margin: EdgeInsets.only(left: 16, right: 8, bottom: 8, top: 8),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Kolors.kOffWhite,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Kolors.kDark.withOpacity(0.1),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(doctor.imageUrl),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctor.name,
                  style: appStyle(
                    16,
                    Kolors.kDark,
                    FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  doctor.specialty,
                  style: appStyle(
                      14, Kolors.kDark.withOpacity(.5), FontWeight.normal),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  doctor.hospital,
                  style: appStyle(
                      14, Kolors.kDark.withOpacity(.4), FontWeight.w400),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 18,
                    ),
                    SizedBox(width: 4),
                    Text(
                      '${doctor.rating}',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 16),
                    Icon(Icons.access_time, color: Colors.grey, size: 18),
                    SizedBox(width: 4),
                    Text(
                      '${doctor.yearsOfExperience} years',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
