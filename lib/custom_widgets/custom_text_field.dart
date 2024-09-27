import 'package:flutter/material.dart';
import 'package:zini_task/resources/app_color.dart';
import 'package:zini_task/resources/text_styles.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;

  final String hintText;
  final FocusNode? focusNode;

  const CustomTextField({
    super.key,
    this.controller,
    required this.hintText,

    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 288,
      height: 46,
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        style: montserrat(size: 16, color:  AppColor.secondaryColor),
        cursorColor: AppColor.primaryColor,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(16),
          filled: true,
          fillColor: AppColor.fillColor,
          hintText: hintText,
          hintStyle: montserrat(size: 16, color:  AppColor.secondaryColor),
          enabledBorder: OutlineInputBorder(

            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(

            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
