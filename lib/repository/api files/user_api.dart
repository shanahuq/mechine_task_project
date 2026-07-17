import 'package:http/http.dart';

import '../api/Api_client.dart';

class UserApi {
  final ApiClient apiClient = ApiClient();

  Future<Response> getUser() async {
    return await apiClient.invokeAPI(
      "http://easycard.rootsys.in/api/user",
      "GET",
      null,
    );
  }
}