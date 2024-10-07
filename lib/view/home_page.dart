import 'package:flutter/material.dart';
import 'package:flutter_background/flutter_background.dart';
import 'package:provider/provider.dart';
import 'package:sms_receiver/sms_receiver.dart';
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

  String? _textContent = 'Waiting for messages...';

  SmsReceiver? _smsReceiver;

  // bool isSyncing = false;

@override
  void initState() {
    // TODO: implement initState
  _smsReceiver = SmsReceiver(onSmsReceived, onTimeout: onTimeout);
  _startListening();
    super.initState();
  }



  void onTimeout() {
    setState(() {
      _textContent = 'Timeout!!!';
    });
  }

  void onSmsReceived(String? message) async {

    final provider = Provider.of<AuthProvider>(context, listen: false);

    setState(() {
      _textContent = message;
    });

    if (provider.isBackgroundRunning && message != null) {
      provider.smsSync();
    }
  }
  void _startListening() async {
    if (_smsReceiver == null) return;
    await _smsReceiver?.startListening();
    setState(() {
      _textContent = 'Waiting for messages...';
    });
  }

  void _stopListening() async {
    if (_smsReceiver == null) return;
    await _smsReceiver?.stopListening();
    setState(() {
      _textContent = 'Listener Stopped';
    });
  }



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
                    provider.isBackgroundRunning = !provider.isBackgroundRunning;
                    // bool enabled =
                    //     FlutterBackground.isBackgroundExecutionEnabled;
                    // if (enabled) {
                    //   await FlutterBackground.disableBackgroundExecution();
                    //   provider.setBackgroundRunning(false);
                    // } else {
                    //   bool success =
                    //       await FlutterBackground.enableBackgroundExecution();
                    //   if (success) {
                    //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    //       content:
                    //           Text("Background execution enabled successfully"),
                    //     ));
                    //     provider.setBackgroundRunning(true);
                    //   } else {
                    //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    //       content:
                    //           Text("Failed to enable background execution"),
                    //     ));
                    //   }
                    // }

                    // provider.smsSync();
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
