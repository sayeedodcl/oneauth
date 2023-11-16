import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oneauth/utilits/themes/color_data.dart';
import 'package:oneauth/utilits/themes/font_data.dart';

class Styles {
  static showToastSucces(m, context) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            m.toString(),
            style: FontDatas.h4regular(ColorsData.white),
          ),
          backgroundColor: Colors.green,
        ),
      );
  static showToastWarning(m, context) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            m.toString(),
            style: FontDatas.h4regular(ColorsData.bgcolor),
          ),
          backgroundColor: Colors.yellowAccent,
        ),
      );
  static showToastError(m, context) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            m.toString(),
            style: FontDatas.h4regular(ColorsData.white),
          ),
          backgroundColor: Colors.red,
        ),
      );
}
