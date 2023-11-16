import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:oneauth/utilits/themes/color_data.dart';
import 'package:oneauth/utilits/themes/font_data.dart';
import 'package:oneauth/views/screens/auth/oneTimeLogin.dart';
import 'package:oneauth/views/screens/dashboard/main_dashboard.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  ///******************************* controller ***************** */
  TextEditingController email = TextEditingController();
  TextEditingController fullname = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    fullname.dispose();
    password.dispose();
    super.dispose();
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
                  "SignUp".toUpperCase(),
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
              if (email.text.isNotEmpty &&
                  password.text.isNotEmpty &&
                  fullname.text.isNotEmpty) {
                Get.snackbar("Login success", "welcome sir");
                /***************************************** server check************************* */
              } else {
                Get.to(
                  OneTimeLogin(),
                );
              }
            } catch (e) {
              print(e);
            }
          },
          /****************************** back area ****************** */
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Icon(
                  Icons.arrow_back,
                  color: ColorsData.white,
                ),
              ),
              Flexible(
                flex: 5,
                child: Text(
                  "Already have a Account  ",
                  style: FontDatas.h3Normal(Colors.white),
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
          controller: fullname,
          style: FontDatas.h3regular(ColorsData.white),
          decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 5.w, vertical: 0.h),
            labelText: "Full Name",
            labelStyle: FontDatas.h3Normal(ColorsData.white),
            border: OutlineInputBorder(
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
        /**************
         * ******** userId area*************
         * *****************/
        TextField(
          controller: email,
          style: FontDatas.h3regular(ColorsData.white),
          decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 5.w, vertical: 0.h),
            labelText: "Email",
            labelStyle: FontDatas.h3Normal(ColorsData.white),
            border: OutlineInputBorder(
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
            labelText: "Password",
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
