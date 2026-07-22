import 'package:http/http.dart';

import '../api/Api_client.dart';

class OperatorsApi {
  final ApiClient apiClient = ApiClient();

  Future<Response> getOperator() async {
    return await apiClient.invokeAPI(
      "https://easycard.rootsys.in/api/cards/data-card/operators",
      "GET",
      null,
    );
  }
}