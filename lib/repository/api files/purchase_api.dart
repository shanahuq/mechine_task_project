import 'dart:convert';
import 'package:http/http.dart';

import '../api/Api_client.dart';

class PurchaseApi {
  final ApiClient apiClient = ApiClient();

  Future<Response> createPurchase({
    required int planId,
    required int quantity,
  }) async {
    final body = jsonEncode({
      "plan_id": planId,
      "quantity": quantity,
    });

    return await apiClient.invokeAPI(
      "https://easycard.rootsys.in/api/cards/data-card/orders",
      "POST",
      body,
    );
  }
}