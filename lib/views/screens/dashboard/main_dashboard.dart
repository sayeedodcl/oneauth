import 'dart:async';
import 'dart:math';

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:circular_timer/circular_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:oneauth/utilits/customwidget/circulerLoader.dart';
import 'package:oneauth/utilits/db/hive.dart';
import 'package:oneauth/utilits/styles.dart';
import 'package:oneauth/utilits/themes/color_data.dart';
import 'package:oneauth/utilits/themes/font_data.dart';
import 'package:oneauth/views/screens/auth/auth.dart';
import 'package:oneauth/views/screens/dashboard/otpscan.dart';
import 'package:otp/otp.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MainDashboard extends StatefulWidget {
  const MainDashboard({super.key});

  @override
  State<MainDashboard> createState() => _MainDashboardState();
}

var otpDuration = 30;
var progressStep = 30;

////***********************
///       * ****************** genarete OTP
///   * ************************/
gencodes(getmyOTP) {
  var n = DateTime.now();
  print(n.timeZoneName);
  print(n);
  var mytime;
  if (n.second > 30) {
    print("nextOTP");
    mytime = DateTime.parse(
        '${n.year}-${n.month}-${n.day} ${n.hour < 10 ? '0' + n.hour.toString() : n.hour}:${n.minute < 10 ? '0' + n.minute.toString() : n.minute}:30');
  } else {
    print("preiviuos OTP");
    mytime = DateTime.parse(
        '${n.year}-${n.month}-${n.day} ${n.hour < 10 ? '0' + n.hour.toString() : n.hour}:${n.minute < 10 ? '0' + n.minute.toString() : n.minute}:00');
  }

  final code2 = OTP.generateTOTPCodeString(
      getmyOTP, mytime.millisecondsSinceEpoch,
      interval: 30, isGoogle: false);

  return code2;
}

class _MainDashboardState extends State<MainDashboard> {
  List myListAccount = [];
  CountDownController _controller = CountDownController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMyAccout();
  }

  var randCol = [
    Colors.green,
    Colors.orange,
    Colors.blueAccent,
    Colors.amber,
    Colors.redAccent
  ];

  getMyAccout() async {
    try {
      var d = await HiveDB().fetchUserAccount("myAccount", "list");
      myListAccount = d;
    } catch (e) {
      print(e);
    }
    setState(() {});
  }

  ////***********************
  //     * Timer for rerendaring  UI
  //    * ************************ */
  timers() async {
    Timer.periodic(Duration(seconds: otpDuration), (timer) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsData.bgcolor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 10.sp),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15.sp),
                child: SizedBox(
                  height: 25.sp,
                  child: Row(
                    children: [
                      Image(
                          width: 25.w,
                          image: const AssetImage("assets/applogo.png"))
                    ],
                  ),
                ),
              ),
              Expanded(
                  flex: 6,
                  child: myListAccount.isEmpty
                      ? const Center(
                          child: Text(
                            "Welcome To One Auth",
                            style:
                                TextStyle(fontSize: 18.0, color: Colors.white),
                          ),
                        )
                      : ListView.builder(
                          itemCount: myListAccount.length,
                          itemBuilder: (context, int index) {
                            timers(); ///////////*************************** calling timer fuction for preiodic refresh
                            int r = Random().nextInt(5);
                            return Padding(
                                padding: EdgeInsets.symmetric(vertical: 1.w),
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5),
                                        boxShadow: [
                                          BoxShadow(
                                              offset: Offset(4, 1),
                                              spreadRadius: 27,
                                              color: Colors.white10,
                                              blurRadius: 25)
                                        ]),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 2.w, vertical: 8.0),
                                      child: Row(children: [
                                        CircleAvatar(
                                          radius: 30,
                                          backgroundColor: randCol[r],
                                          child: Text(
                                            myListAccount[index]['account']
                                                .toString()
                                                .split(':')[0]
                                                .toString(),
                                            style: FontDatas.h4bold(
                                                ColorsData.white),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5.0,
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(myListAccount[index]
                                                      ['account']
                                                  .toString()
                                                  .replaceAll('%', "@")),
                                              SizedBox(
                                                height: 1.w,
                                              ),
                                              Text(
                                                gencodes(
                                                  myListAccount[index]
                                                      .toString(),
                                                ),
                                                style: const TextStyle(
                                                    fontSize: 20.0,
                                                    fontWeight: FontWeight.w800,
                                                    color: Colors.black),
                                              ),
                                            ],
                                          ),
                                        ),
                                        // CirculerTimer(
                                        //   control: _controller,
                                        // ),
                                        const Padding(
                                          padding: EdgeInsets.all(15.0),
                                          child: CircularTimer(
                                              duration: Duration(seconds: 30),
                                              radius: 15,
                                              color: Color.fromARGB(
                                                  255, 54, 126, 233),
                                              repeat: true,
                                              outline: true,
                                              outlinedPadding: 0.0,
                                              startAngle: -1,
                                              outlinedWidth: 3.0),
                                        ),
                                      ]),
                                    )));
                          }))
            ],
          ),
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          Get.to(
            const AddDevices(),
          );
        },
        child: const CircleAvatar(
          backgroundColor: Colors.red,
          radius: 25,
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(covariant MainDashboard oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }
}
