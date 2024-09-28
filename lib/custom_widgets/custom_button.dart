
import 'package:flutter/material.dart';
import 'package:zini_task/resources/app_color.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final TextStyle textStyle;
  final VoidCallback onPressed;
  final Color buttonColor;
  final bool loading;

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
    this.loading = false,
    this.borderRadius = 10, required this.textStyle,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: loading ? CircularProgressIndicator()  : Text(
        buttonText,
        style: textStyle,
      ),
      style: ElevatedButton.styleFrom(
        fixedSize:loading ? Size(width, height+10):  Size(width, height),
        backgroundColor: buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}

