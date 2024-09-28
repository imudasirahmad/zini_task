import 'package:flutter/material.dart';
import 'package:flutter_background/flutter_background.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:zini_task/resources/app_color.dart';
import 'package:zini_task/view/login_page.dart';
import 'package:zini_task/view_models/auth_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Permission.notification.request();
  var status = await Permission.notification.status;
  if (status.isDenied) {
    await Permission.notification.request();
  }

  final androidConfig = FlutterBackgroundAndroidConfig(
    notificationTitle: "Zini Task",
    notificationText: "App is running in the background",
    notificationImportance: AndroidNotificationImportance.high,
    // notificationIcon: AndroidResource(
    //     name: 'launch_background',
    //     defType: 'drawable'), // Default is ic_launcher from folder mipmap
  );

  bool success =
      await FlutterBackground.initialize(androidConfig: androidConfig);
  debugPrint("success $success");
  bool backgroundExecution =
      await FlutterBackground.enableBackgroundExecution();
  print("backgroundExecution $backgroundExecution");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Zini Task',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primaryColor),
          useMaterial3: true,
        ),
        home: LoginPage(),
      ),
    );
  }
}
