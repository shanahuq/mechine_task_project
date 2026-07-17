import 'package:http/http.dart';

import '../api/Api_client.dart';

class PlansApi {
  final ApiClient apiClient = ApiClient();

  Future<Response> getPlans() async {
    return await apiClient.invokeAPI(
      "http://easycard.rootsys.in/api/cards/datacard/plans?operator=1",
      "GET",
      null,
    );
  }
}