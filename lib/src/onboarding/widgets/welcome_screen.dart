
import 'package:docpill/commons/utils/kcolors.dart';
import 'package:docpill/commons/utils/kstrings.dart';
import 'package:docpill/commons/widgets/app_style.dart';
import 'package:docpill/commons/widgets/custom_button.dart';
import 'package:docpill/commons/widgets/reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

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
              "https://lottie.host/8458987d-1b34-4b7a-837a-e8b664b95a2f/R3aUcVrNvP.json",
            ),
            SizedBox(
              height: 30.h,
            ),
            Text(
              AppText.kWelcomeHeader,
              textAlign: TextAlign.center,
              style: appStyle(
                24,
                Kolors.kPrimary,
                FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              width: ScreenUtil().screenWidth - 100,
              child: Text(
                AppText.kWelcomeMessage,
                textAlign: TextAlign.center,
                style: appStyle(
                  14,
                  Kolors.kDark.withOpacity(0.5),
                  FontWeight.normal,
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
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ReusableText(text: 'Already have an Account ?', style: appStyle(12, Kolors.kDark, FontWeight.normal)),
                TextButton(onPressed: (){
                  context.go('/login');
                }, child: Text('Sign In', style: appStyle(12, Kolors.kPrimary, FontWeight.normal),))
              ],
            )
          ],
        ),
      ),
    );
  }
}