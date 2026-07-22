import 'package:http/http.dart' as http;

import '../api/Api_client.dart';

class LoginApi {
  final ApiClient apiClient = ApiClient();

  Future<http.Response> login(String phone, String password) async {
    return await apiClient.invokeAPI(
      "https://easycard.rootsys.in/api/login",
      "POST",
      {
        "mobile": phone,
        "password": password,
        "device_name": "oneplus",
      },
    );
  }
}