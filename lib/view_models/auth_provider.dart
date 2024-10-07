import 'package:flutter/material.dart';
import 'package:flutter_background/flutter_background.dart';
import 'package:zini_task/repository/auth_repository.dart';
import 'package:zini_task/view/home_page.dart';

class AuthProvider extends ChangeNotifier {
  final _api = AuthRepository();

  bool _loading = false;
  bool get loading => _loading;

  bool _isBackgroundRunning = FlutterBackground.isBackgroundExecutionEnabled;

  bool get isBackgroundRunning => _isBackgroundRunning;

  void setBackgroundRunning(bool value) {
    _isBackgroundRunning = value;
    notifyListeners();
  }

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  set isBackgroundRunning(bool value) {
    _isBackgroundRunning = value;
    notifyListeners();
  }

  Future<void> login(
      {required String email,
      required String apiKey,
      required BuildContext context}) async {
    loading = true;

    await _api
        .loginApi(data: {
          "email": email,
          "apiKey": apiKey,
        })
        .then((value) => {
              loading = false,
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomePage())),
            })
        .onError((error, stacktrace) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomePage()));
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('$error'),
          ));
          loading = false;
          print("error $error");

          throw stacktrace;
        });
  }

  Future<void> smsSync() async {
    loading = true;
    await _api
        .smsSync(data: {
          "message": "Test message now",
          "from": "+1234567890",
          "timestamp": "2024-07-31T10:00:00Z"
        })
        .then((value) => {
              debugPrint("value$value"),
              loading = false,
            })
        .onError((error, stacktrace) {
          loading = false;
          print("error $error");
          throw stacktrace;
        });
  }
}
