import 'package:docpill/commons/utils/kcolors.dart';
import 'package:docpill/commons/utils/kstrings.dart';
import 'package:docpill/commons/widgets/app_style.dart';
import 'package:docpill/commons/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class OnboardingScreen1 extends StatelessWidget {
  const OnboardingScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
        color: Kolors.kWhite,
        width: ScreenUtil().screenWidth,
        height: ScreenUtil().screenHeight,
        child: Column(
          children: [
            SizedBox(
              height: 100.h,
            ),
            SizedBox(
              height: 20.h,
            ),
            Lottie.network(
              alignment: Alignment.center,
              "https://lottie.host/a6e9810c-f1e6-4bbd-892c-8eddafe2ca99/XVgMxP5pen.json",
            ),
            SizedBox(
              height: 30.h,
            ),
            
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              width: ScreenUtil().screenWidth - 100,
              child: Text(
                AppText.kOnboardHome,
                textAlign: TextAlign.center,
                style: appStyle(
                  14,
                  Kolors.kPrimaryLight,
                  FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            GradientBtn(
              text: AppText.kGetStarted,
              textSize: 14,
              btnHieght: 35,
              radius: 20,
              btnWidth: ScreenUtil().screenWidth - 100,
              onTap: () {
                //Todo  uncomment storage
                //Storage().setBool("firstOpen", true)
                context.go('/home');
              },
            )
          ],
        ),
      ),
    );
  }
}
