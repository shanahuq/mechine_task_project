import 'package:http/http.dart';

import '../api/Api_client.dart';

class OperatorsApi {
  final ApiClient apiClient = ApiClient();

  Future<Response> getUser() async {
    return await apiClient.invokeAPI(
      "http://easycard.rootsys.in/api/cards/datacard/operators ",
      "GET",
      null,
    );
  }
}