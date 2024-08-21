import 'package:docpill/commons/utils/kcolors.dart';
import 'package:docpill/commons/widgets/app_style.dart';
import 'package:docpill/commons/widgets/header_diagnostic.dart';
import 'package:flutter/material.dart';

import '../../../const/uidata.dart';

class DiagnosticWidget extends StatelessWidget {
  final List<TestkitData> testkits;
  final VoidCallback onBookNow;
  const DiagnosticWidget(
      {super.key, required this.testkits, required this.onBookNow, });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeaderDiagnostic(
          onViewAllPressed: onBookNow,
        ),
        SizedBox(
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: testkits.length,
            itemBuilder: (context, index) {
              return _buildTestkitCard(testkits[index]);
            },
          ),
        )
      ],
    );
  }
  Widget _buildTestkitCard (TestkitData testkit) {
    return Container(
      width: 200,
      margin: EdgeInsets.only(left: 16, right: 8, bottom: 8, top: 8),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Kolors.kWhite.withOpacity(.8),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Kolors.kDark.withOpacity(0.1),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(testkit.image),
          ),
          SizedBox(height: 4),
          Text(
            testkit.name,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 2,),
          Text(
            testkit.description,
            style: appStyle(10, Kolors.kDark.withOpacity(0.7), FontWeight.w500),

          ),
          SizedBox(height: 4,),
          Text(
            '  ksh${testkit.price}.99',
            style: appStyle(
             20,
             Kolors.kPrimary,
             FontWeight.bold,
            ),
          ),
          ElevatedButton(
            onPressed: onBookNow,
            child: Text('Book Now'),
            style: ElevatedButton.styleFrom(
              foregroundColor: Kolors.kOffWhite,
              backgroundColor: Kolors.kPrimaryLight,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
