
import 'package:flutter/material.dart';
import 'package:zini_task/resources/app_color.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final TextStyle textStyle;
  final VoidCallback onPressed;
  final Color buttonColor;

  final double width;
  final double height;
  final double borderRadius;



  const CustomButton({
    Key? key,
    required this.buttonText,
    required this.onPressed,
    this.buttonColor = AppColor.primaryColor,
    this.width = double.infinity,
    this.height = 46,
    this.borderRadius = 10, required this.textStyle,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: textStyle,
      ),
      style: ElevatedButton.styleFrom(
        fixedSize: Size(width, height),
        backgroundColor: buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}

