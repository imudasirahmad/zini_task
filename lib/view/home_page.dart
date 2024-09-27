import 'package:flutter/material.dart';
import 'package:zini_task/custom_widgets/custom_button.dart';
import 'package:zini_task/resources/image_assets.dart';
import 'package:zini_task/resources/text_styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 176),
            Image.asset(
              AppImages.active,
              height: 164,
              width: 164,
            ),
            SizedBox(height: 18),
            Text(
              "Active",
              style: acme(color: Colors.black, size: 36),
            ),
            SizedBox(height: 168),
            CustomButton(
              height: 46,
              width: 288,
              borderRadius: 20,
              buttonText: 'Stop',
              onPressed: () {},
              textStyle: acme(size: 36, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
