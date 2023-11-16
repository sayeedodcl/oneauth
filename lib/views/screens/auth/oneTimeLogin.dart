import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ntp/ntp.dart';
import 'package:oneauth/utilits/db/hive.dart';
import 'package:oneauth/utilits/themes/color_data.dart';
import 'package:oneauth/utilits/themes/font_data.dart';
import 'package:oneauth/views/screens/dashboard/main_dashboard.dart';
import 'package:oneauth/views/screens/dashboard/otpscan.dart';
import 'package:otp/otp.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OneTimeLogin extends StatefulWidget {
  const OneTimeLogin({super.key});

  @override
  State<OneTimeLogin> createState() => _OneTimeLoginState();
}

var otpDuration = 30;
var progressStep = 30;

///***********************
///   * ****************** genarete OTP
///   * ************************
gencodes(getmyOTP) {
  final code2 = OTP.generateTOTPCodeString(
      getmyOTP, DateTime.now().millisecondsSinceEpoch,
      length: 4, interval: 10, isGoogle: false);

  return code2;
}

class _OneTimeLoginState extends State<OneTimeLogin> {
  ///******************************* controller ***************** */
  TextEditingController userid = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void dispose() {
    userid.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    getData();
    var n = DateTime.now();
    print(n.timeZoneName);
    print(n);
  }

  getData() async {
    DateTime startDate = await NTP.now();
    var diff = startDate.difference(DateTime.now().toUtc()).abs();
    if (diff > Duration(minutes: 1)) {
      // ignore: use_build_context_synchronously
      showDialog(
          context: context,
          builder: (_) => Container(
                height: 100.h,
                width: 100.w,
                color: Colors.black87,
                child: Column(
                  children: [
                    SizedBox(
                      height: 30.h,
                    ),
                    const Flexible(
                        flex: 4,
                        child: Image(
                            width: 150, image: AssetImage("assets/tm.png"))),
                    const Text(
                      "Pleases Check your device time",
                      style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.none,
                          color: Colors.white),
                    ),
                  ],
                ),
              ));
    } else {
      print("nothing");
    }
    // print('NTP DateTime: ${startDate}');

    var d = await HiveDB().fetchUserAccount("myAccount", "list");
    print(d);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsData.bgcolor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.w),
          child: Column(
            children: [
              // /*****************
              ///* **** Logo area
              /// * ********** *************  */
              Container(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 25.sp),
                  child: Image(
                    width: Adaptive.w(30),
                    image: AssetImage("assets/applogo.png"),
                  ),
                ),
              ),
              Container(
                width: 100.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 4.w,
                    ),
                    Text(
                      "Welcome to ",
                      textAlign: TextAlign.center,
                      style: FontDatas.fontCustom(ColorsData.white, 18.5.sp,
                          FontWeight.w200, null, 0.8),
                    ),
                    SizedBox(
                      height: 1.w,
                    ),
                    Text(
                      "One Authenticator",
                      textAlign: TextAlign.center,
                      style: FontDatas.fontCustom(ColorsData.white, 21.5.sp,
                          FontWeight.w400, null, 0.5),
                    ),
                    SizedBox(
                      height: 1.w,
                    ),
                    Text(
                      "Secure Your Account",
                      textAlign: TextAlign.center,
                      style: FontDatas.fontCustom(ColorsData.white, 25.5.sp,
                          FontWeight.w600, null, 0.1),
                    ),
                    SizedBox(
                      height: 6.w,
                    ),
                  ],
                ),
              ),
              /****************************
             * ************form input ***********
             * *********************** */
              formdata(),
              SizedBox(
                height: 4.3.w,
              ),
              /************************* button for login *************************** */
              Container(
                width: 100.w,
                height: 6.h,
                alignment: Alignment.center,
                color: Colors.red[700],
                child: Text(
                  "Login In".toUpperCase(),
                  style: FontDatas.h2regular(ColorsData.white),
                ),
              )
            ],
          ),
        ),
      ),

      /*************************
       * ********navigato to dashboard *****
       * ************** */
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.h),
        child: GestureDetector(
          onTap: () {
            try {
              if (userid.text.isNotEmpty && password.text.isNotEmpty) {
                Get.snackbar("Login success", "welcome sir");
              } else {
                Get.to(
                  MainDashboard(),
                );
              }
            } catch (e) {
              print(e);
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 5,
                child: Text(
                  "Create new Account  ",
                  style: FontDatas.h3Normal(Colors.white),
                ),
              ),
              Flexible(
                child: Icon(
                  Icons.arrow_forward,
                  color: ColorsData.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  formdata() {
    return Column(
      children: [
        /**************
         * ******** userId area*************
         * *****************/
        TextField(
          controller: userid,
          style: FontDatas.h3regular(ColorsData.white),
          decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 5.w, vertical: 0.h),
            labelText: "Enter ODCL ID",
            labelStyle: FontDatas.h3Normal(ColorsData.white),
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white54, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: ColorsData.white, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: Colors.white38, width: .8),
            ),
          ),
        ),

        /** end of Userid */

        SizedBox(
          height: 4.w,
        ),
        /******************
         * **** password area***************
         * ***************/
        TextField(
          style: FontDatas.h3regular(ColorsData.white),
          controller: password,
          decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 5.w, vertical: 0.h),
            labelText: "Enter Password",
            labelStyle: FontDatas.h3Normal(ColorsData.white),
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white54, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: ColorsData.white, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: Colors.white38, width: .8),
            ),
          ),
        ) /** end of Userid */
      ],
    );
  }
}
