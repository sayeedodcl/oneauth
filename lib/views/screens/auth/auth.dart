import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oneauth/utilits/db/hive.dart';
import 'package:oneauth/utilits/themes/color_data.dart';
import 'package:oneauth/utilits/themes/font_data.dart';

import 'package:oneauth/views/screens/dashboard/main_dashboard.dart';
import 'package:oneauth/views/screens/dashboard/otpscan.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

class AddDevices extends StatefulWidget {
  const AddDevices({super.key});

  @override
  State<AddDevices> createState() => _AddDevicesState();
}

class _AddDevicesState extends State<AddDevices> {
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
  }

  getData() async {
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
              formdata()
            ],
          ),
        ),
      ),

      /*************************
       * ********navigato to dashboard *****
       * ************** */
      floatingActionButton: GestureDetector(
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
        child: const CircleAvatar(
          backgroundColor: Colors.red,
          radius: 25,
          child: Icon(Icons.arrow_forward),
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
        // TextField(
        //   controller: userid,
        //   decoration: InputDecoration(
        //     contentPadding:
        //         EdgeInsets.symmetric(horizontal: 5.w, vertical: 0.h),
        //     labelText: "Enter ODCL ID",
        //     labelStyle: FontDatas.h3Normal(ColorsData.white),
        //     border: OutlineInputBorder(
        //       borderSide: BorderSide(color: Colors.white54, width: 1),
        //     ),
        //     focusedBorder: OutlineInputBorder(
        //       borderRadius: BorderRadius.circular(5),
        //       borderSide: BorderSide(color: ColorsData.white, width: 1),
        //     ),
        //     enabledBorder: OutlineInputBorder(
        //       borderRadius: BorderRadius.circular(5),
        //       borderSide: BorderSide(color: Colors.white38, width: .8),
        //     ),
        //   ),
        // ),

        /** end of Userid */
        /***************************
         * qrcode area
         * *********************************
         * 
         */
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Text(
            //   "Scan my code",
            //   textAlign: TextAlign.center,
            //   style: FontDatas.h2Normal(ColorsData.white),
            // ),
            IconButton(
                onPressed: () {
                  // Navigator.pushReplacement(context,
                  //     MaterialPageRoute(builder: (_) => OtpScannner()));
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => OtpScannner()));
                },
                icon: Icon(
                  Icons.qr_code_scanner_outlined,
                  color: ColorsData.white,
                  size: 28.sp,
                )),
          ],
        ),

        SizedBox(
          height: 4.w,
        ),
        /******************
         * **** password area***************
         * ***************/
        TextField(
          controller: password,
          decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 5.w, vertical: 0.h),
            labelText: "Enter ODCL Key",
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
