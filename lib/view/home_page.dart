import 'package:flutter/material.dart';
import 'package:flutter_background/flutter_background.dart';
import 'package:provider/provider.dart';
import 'package:zini_task/custom_widgets/custom_button.dart';
import 'package:zini_task/resources/image_assets.dart';
import 'package:zini_task/resources/text_styles.dart';
import 'package:zini_task/view_models/auth_provider.dart';

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
            Consumer<AuthProvider>(
              builder: (context, provider, child) {
                return Image.asset(
                  provider.isBackgroundRunning
                      ? AppImages.active
                      : AppImages.notActive,
                  height: 164,
                  width: 164,
                );
              },
            ),
            SizedBox(height: 18),
            Consumer<AuthProvider>(
              builder: (context, provider, child) {
                return Text(
                  provider.isBackgroundRunning ? "Active" : "Disabled",
                  style: acme(color: Colors.black, size: 36),
                );
              },
            ),
            SizedBox(height: 168),
            Consumer<AuthProvider>(
              builder: (context, provider, child) {
                return CustomButton(
                  height: 46,
                  width: 288,
                  borderRadius: 20,
                  loading: provider.loading,
                  buttonText: provider.isBackgroundRunning ? 'Stop' : 'Start',
                  onPressed: () async {
                    bool enabled =
                        FlutterBackground.isBackgroundExecutionEnabled;
                    if (enabled) {
                      await FlutterBackground.disableBackgroundExecution();
                      provider.setBackgroundRunning(false);
                    } else {
                      bool success =
                          await FlutterBackground.enableBackgroundExecution();
                      if (success) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content:
                              Text("Background execution enabled successfully"),
                        ));
                        provider.setBackgroundRunning(true);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content:
                              Text("Failed to enable background execution"),
                        ));
                      }
                    }

                    provider.smsSync();
                  },
                  textStyle: acme(size: 36, color: Colors.white),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
