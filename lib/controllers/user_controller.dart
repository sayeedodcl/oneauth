import 'dart:html';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:oneauth/utilits/apis.dart';
import 'package:oneauth/utilits/db/hive.dart';

class UserController {
  static userLogin(username, password) async {
    ////************************************ */ url*******************************
    var url = Uri.parse(Api.loginApi);

    //******************* header area  ***************/
    var headersList = {'Accept': 'application/json'};

    //******************************** Body part ************** */
    var bodypart = {
      "email": username.toString(),
      "password": password.toString()
    };
    //******************************** addig  all together ************** */
    var req = await http.MultipartRequest('POST', url);
    req.headers.addAll(headersList);
    req.fields.addAll(bodypart);

    try {
      /// sending all data *********************************
      var respons = await req.send();
      // geting  response from server *************************************
      final resBody = await respons.stream.bytesToString();

      if (respons.statusCode >= 200 && respons.statusCode < 300) {
        if (resBody.isNotEmpty) {
          /// ********** saving user info to local DB ***********
          HiveDB().storeUser("userinfo", "info", resBody);
        } else {
          Get.showSnackbar(const GetSnackBar(
            message: "Login failed Try again",
          ));
        }
      } else {
        Get.snackbar(
          "",
          "Server error ${respons.statusCode}",
        );
      }
    } catch (e) {
      print(e);
    }
  }

  static userSignup(fullname, email, password) async {
    ////************************************ */ url*******************************
    var url = Uri.parse(Api.signupApi);

    //******************* header area  ***************/
    var headersList = {'Accept': 'application/json'};

    //******************************** Body part ************** */
    var bodypart = {
      "fullname": fullname.toString(),
      "email": email.toString(),
      "password": password.toString()
    };
    //******************************** addig  all together ************** */
    var req = await http.MultipartRequest('POST', url);
    req.headers.addAll(headersList);
    req.fields.addAll(bodypart);

    try {
      /// sending all data *********************************
      var respons = await req.send();
      // geting  response from server *************************************
      final resBody = await respons.stream.bytesToString();

      if (respons.statusCode >= 200 && respons.statusCode < 300) {
        if (resBody.isNotEmpty) {
          /// ********** saving user info to local DB ***********
          HiveDB().storeUser("userinfo", "info", resBody);
        } else {
          Get.showSnackbar(const GetSnackBar(
            message: "Login failed Try again",
          ));
        }
      } else {
        Get.showSnackbar(const GetSnackBar(
          message: "Server error ",
        ));
      }
    } catch (e) {
      print(e);
    }
  }
}
