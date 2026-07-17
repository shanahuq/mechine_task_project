import 'package:http/http.dart';

import '../api/Api_client.dart';

class WalletApi {
  final ApiClient apiClient = ApiClient();

  Future<Response> getWallet() async {
    return await apiClient.invokeAPI(
      "http://easycard.rootsys.in/api/user/wallet ",
      "GET",
      null,
    );
  }
}