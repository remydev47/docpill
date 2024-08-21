import 'package:docpill/commons/services/storage.dart';
import 'package:docpill/commons/utils/kcolors.dart';
import 'package:docpill/commons/widgets/login_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:go_router/go_router.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (Storage().getString('accessToken') == null ) {
          loginBottomSheet(context);
        }
        context.push('/notifications');
      },
      child: Padding(
        padding: EdgeInsets.only(
          right: 12,
        ),
        child: CircleAvatar(
          backgroundColor: Kolors.kWhite.withOpacity(0.3),
          child: Badge(
            label: Text('4'),
            child: Icon(
              Ionicons.notifications,
              color: Kolors.kPrimaryLight,
            ),
          ),
          
        ),
      ),
    );
  }
}
