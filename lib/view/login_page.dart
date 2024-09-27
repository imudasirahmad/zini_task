import 'package:flutter/material.dart';
import 'package:zini_task/custom_widgets/custom_button.dart';
import 'package:zini_task/custom_widgets/custom_text_field.dart';
import 'package:zini_task/resources/app_color.dart';
import 'package:zini_task/resources/image_assets.dart';
import 'package:zini_task/resources/text_styles.dart';
import 'package:zini_task/view/home_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController apiKeyController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 82,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Image.asset(AppImages.loginPageIcon),
              ),
              SizedBox(
                height: 14,
              ),
              Center(
                child: Text(
                  "Log in",
                  style: montserratBold(size: 24),
                ),
              ),
              SizedBox(
                height: 32,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Email",
                      style:
                          montserrat(size: 18, color: AppColor.secondaryColor),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    CustomTextField(
                      controller: emailController,
                      hintText: 'johndoe@gmail.com',
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Api Key",
                      style:
                          montserrat(size: 18, color: AppColor.secondaryColor),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    CustomTextField(
                      controller: apiKeyController,
                      hintText: '',
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    CustomButton(
                      height: 46,
                      width: 288,
                      borderRadius: 20,
                      buttonText: 'Log in',
                      onPressed: () {
                        FocusManager.instance.primaryFocus?.unfocus();

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      },
                      textStyle:
                          montserrat(size: 18, color: AppColor.fillColor),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
