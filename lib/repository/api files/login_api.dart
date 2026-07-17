import 'dart:convert';

import 'package:http/http.dart';

import '../api/Api_client.dart';

class LoginApi {
  ApiClient apiClient = ApiClient();

  Future<Response> login(
    String phone,
    String password,
  ) async {
    return await apiClient.invokeAPI(
      "http://easycard.rootsys.in/api/login",
      "POST",
      jsonEncode({
        "phone": phone,
        "password": password,
      }),
    );
  }
}