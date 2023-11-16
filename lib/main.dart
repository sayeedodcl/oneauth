import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:oneauth/utilits/themes/font_data.dart';
import 'package:oneauth/views/screens/splash_screen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

myCounter() {
  return TimerCountdown(
    format: CountDownTimerFormat.secondsOnly,
    timeTextStyle: FontDatas.h4bold(const Color.fromARGB(228, 255, 82, 82)),
    endTime: DateTime.now().add(
      const Duration(
        seconds: 30,
      ),
    ),
    onEnd: () {
      // setState(() {
      //   progressStep = 0;
      // });
    },
  );
}

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  runApp(const OneAuth());
}

class OneAuth extends StatelessWidget {
  const OneAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, screenType, oriention) {
      return const GetMaterialApp(
        home: SplashScreen(),
      );
    });
  }
}
