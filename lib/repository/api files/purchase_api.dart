import 'package:http/http.dart';

import '../api/Api_client.dart';

class PurchaseApi {
  final ApiClient apiClient = ApiClient();

  Future<Response> getPurchase() async {
    return await apiClient.invokeAPI(
      "http://easycard.rootsys.in/api/cards/datacard/orders",
      "GET",
      null,
    );
  }
}