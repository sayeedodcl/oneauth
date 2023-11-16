import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CirculerTimer extends StatefulWidget {
  final control;
  const CirculerTimer({this.control, super.key});

  @override
  State<CirculerTimer> createState() => _CirculerTimerState();
}

class _CirculerTimerState extends State<CirculerTimer> {
  CountDownController _controller = CountDownController();
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    _controller = widget.control;
  }

  @override
  void didUpdateWidget(covariant CirculerTimer oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CircularCountDownTimer(
      duration: 30,
      initialDuration: 0,
      controller: widget.control,
      width: 8.w,
      height: 8.w,
      ringColor: Colors.grey[300]!,
      fillColor: Colors.blue,
      fillGradient: null,
      backgroundColor: Colors.black45,
      backgroundGradient: null,
      strokeWidth: 8.0,
      strokeCap: StrokeCap.round,
      textStyle: TextStyle(
          fontSize: 18.0, color: Colors.white, fontWeight: FontWeight.bold),
      textFormat: CountdownTextFormat.S,
      isReverse: false,
      isReverseAnimation: false,
      isTimerTextShown: true,
      autoStart: true,
      onStart: () {
        debugPrint('Countdown Started');
      },
      onComplete: () {
        debugPrint('Countdown Ended');

        setState(() {
          _controller.reset();
          _controller.restart();
        });
      },
      onChange: (String timeStamp) {
        debugPrint('Countdown Changed $timeStamp');
      },
      timeFormatterFunction: (defaultFormatterFunction, duration) {
        if (duration.inSeconds == 0) {
          return "Start";
        } else {
          return Function.apply(defaultFormatterFunction, [duration]);
        }
      },
    );
  }
}
