import 'package:zini_task/data/network/network_api_services.dart';
import 'package:zini_task/resources/app_url.dart';

class AuthRepository {
  final _apiService = NetworkApiServices();

  Future loginApi({required dynamic data}) async {
    dynamic response =
        _apiService.getPostApiResponse(data, AppUrl.loginUrl, "");
    return response;
  }

  Future smsSync({required dynamic data}) async {
    dynamic response =
        _apiService.getPostApiResponse(data, AppUrl.smsSyncUrl, "");
    return response;
  }
}
