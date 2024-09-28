
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:zini_task/resources/app_color.dart';

class Utils{
  static toastMessageCenter(String message) {
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: Colors.white,
        textColor: AppColor.primaryColor,
        gravity: ToastGravity.CENTER);
  }



}