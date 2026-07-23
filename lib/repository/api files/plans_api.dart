import 'package:http/http.dart';

import '../api/Api_client.dart';

class PlansApi {
  final ApiClient apiClient = ApiClient();

  Future<Response> getPlans(String id) async {
    return await apiClient.invokeAPI(
      "https://easycard.rootsys.in/api/cards/data-card/plans?operator=$id",
      "GET",
      null,
    );
  }
}