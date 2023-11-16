import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:oneauth/main.dart';
import 'package:oneauth/utilits/themes/color_data.dart';
import 'package:oneauth/utilits/themes/font_data.dart';
import 'package:otp/otp.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import 'package:simple_timer/simple_timer.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

List<String> company = ["HRMS", "OLMS", "ExpoTech", "Thikthak"];
show() {
  // TODO: implement print
  print("this is form outside");
}

var uidcode = 'JBSWY3DPEHPK3PXP';
var otpDuration = 30;
var progressStep = 30;

/***********************
                       * ****************** genarete OTP  
                       * ************************/
gencodes(getmyOTP) {
  final code2 = OTP.generateTOTPCodeString(
      getmyOTP, DateTime.now().millisecondsSinceEpoch,
      length: 4, interval: 10, isGoogle: false);

  return code2;
}

class _DashboardState extends State<Dashboard> {
  ///**************************
  ///* ************ variable area*******
  /// * ********
  var indcatorValue = 0.0;
  List<Widget> main = [];
  List<Widget> saveList = [];

  @override
  void initState() {
    super.initState();
  }

  counters() {
    Future.delayed(Duration(seconds: 1)).then((value) => {});
    indcatorValue += 1;
  }

  /// **********************
  /// Timer for rerendaring  UI
  // ************************
  timers() async {
    Timer.periodic(Duration(seconds: otpDuration), (timer) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsData.bgcolor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ////*****************************
              /// * List of OTP
              /// * **********************************************
              SizedBox(
                height: 100.h,
                width: 100.w,
                child: ListView.builder(
                    itemCount: company.length,
                    itemBuilder: (BuildContext context, int index) {
                      timers();
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          color: Colors.white70,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              leading: Text(index.toString()),
                              title: Text(company[index].toString()),
                              subtitle: Text(
                                gencodes(
                                  uidcode + company[index].toString(),
                                ),
                                style: FontDatas.h1semi(Colors.red),
                              ),
                              trailing: Stack(
                                children: [
                                  // Positioned(
                                  //   child: Container(
                                  //     height: 25.sp,
                                  //     width: 25.sp,
                                  //     child: CircularProgressIndicator(
                                  //         backgroundColor: Colors.grey,
                                  //         value: counters()),
                                  //   ),
                                  // ),
                                  Positioned(child: myCounter()),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      )),
      floatingActionButton: GestureDetector(
        onTap: () {},
        child: const CircleAvatar(
          radius: 25,
          backgroundColor: Colors.amber,
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(covariant Dashboard oldWidget) {
    // TODO: implement didUpdateWidget

    super.didUpdateWidget(oldWidget);
  }
}
