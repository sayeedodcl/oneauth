import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oneauth/utilits/db/hive.dart';

import 'package:oneauth/utilits/themes/color_data.dart';
import 'package:oneauth/utilits/themes/font_data.dart';

import 'package:oneauth/views/screens/auth/oneTimeLogin.dart';
import 'package:oneauth/views/screens/dashboard/main_dashboard.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  starttimer() {
    Future.delayed(const Duration(seconds: 2)).then((value) => {getMyAccout()});
  }

  @override
  void initState() {
    starttimer();
    super.initState();
  }

  getMyAccout() async {
    var d = await HiveDB().fetchUserAccount("isUserLogin", "user");
    try {
      if (d != null) {
        if (d[0]['isUserLogin'] == true) {
          Get.snackbar("", "Welcome to your Account");
          Get.to(const MainDashboard());
        } else {
          Get.to(const OneTimeLogin());
        }
      } else {
        Get.to(const OneTimeLogin());
      }
    } catch (e) {
      print(e);
      Get.snackbar("", e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsData.bgcolor,
      body: SafeArea(
          child: SizedBox(
        height: 100.h,
        width: 100.w,
        child: Column(
          children: [
            SizedBox(
              height: 35.h,
            ),
            /*******************************
             * * logo area ***********************
             * *********************** */
            Center(
              child:
                  Image(width: 68.sp, image: AssetImage('assets/applogo.png')),
            ),
            SizedBox(
              height: 2.h,
            ),
            /************************* Logoarea ************************** */
            Expanded(
              child: Container(
                width: 60.w,
                child: Text(
                  "Welcome to One Authenticator",
                  textAlign: TextAlign.center,
                  style: FontDatas.fontCustom(
                      ColorsData.white, 16.5.sp, FontWeight.w400, null, 0.8),
                ),
              ),
            ),
            /**************************************  */
            Padding(
              padding: EdgeInsets.symmetric(vertical: 13.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Powered by ",
                    textAlign: TextAlign.center,
                    style: FontDatas.fontCustom(
                        ColorsData.white, 13.sp, FontWeight.w300, null, 0.8),
                  ),
                  Text(
                    "ODCL",
                    textAlign: TextAlign.center,
                    style: FontDatas.h3semi(ColorsData.white),
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
