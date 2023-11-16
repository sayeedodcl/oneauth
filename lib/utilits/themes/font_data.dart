import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FontDatas {
//  ############################ fontsize =12*********************************
  static h1Normal(c) =>
      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w300, color: c);
  static h1regular(c) =>
      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500, color: c);
  static h1semi(c) =>
      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600, color: c);
  static h1bold(c) =>
      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w800, color: c);
  static Customh1(c) =>
      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w800, color: c);

//  ########################### fontsize =12*********************************
  static h2Normal(c) =>
      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w300, color: c);
  static h2regular(c) =>
      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500, color: c);
  static h2semi(c) =>
      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600, color: c);
  static h2bold(c) =>
      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w800, color: c);
  static Customh2(c) =>
      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w800, color: c);
//  ############################ fontsize =12*********************************
  static h3Normal(c) =>
      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w300, color: c);
  static h3regular(c) =>
      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500, color: c);
  static h3semi(c) =>
      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, color: c);
  static h3bold(c) =>
      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w800, color: c);
  static Customh3(c) =>
      TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: c);
//  ############################ fontsize =12*********************************
  static h4Normal(c) =>
      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w300, color: c);
  static h4regular(c) =>
      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w400, color: c);
  static h4semi(c) =>
      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600, color: c);
  static h4bold(c) =>
      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w800, color: c);
  static Customh4(c) =>
      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w800, color: c);
//  ############################ fontsize =12*********************************
  static h5Normal(c) =>
      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w300, color: c);
  static h5regular(c) =>
      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: c);
  static h5semi(c) =>
      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600, color: c);
  static h5bold(c) =>
      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w800, color: c);
  static Customh5(c) =>
      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w800, color: c);
//  ############################ fontsize =12*********************************
  static h6Normal(c) =>
      TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w300, color: c);
  static h6regular(c) =>
      TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500, color: c);
  static h6semi(c) =>
      TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600, color: c);
  static h6bold(c) =>
      TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w800, color: c);
  static Customh6(c) =>
      TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w800, color: c);
  static fontCustom(c, fs, fw, d, l) => TextStyle(
      fontSize: fs, fontWeight: fw, color: c, decoration: d, letterSpacing: l);
}
