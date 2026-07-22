import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Api_Exception.dart';

class ApiClient {
  Future<Response> invokeAPI(String path, String method, Object? body) async {
    Response response;

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? accessToken = prefs.getString("accessToken");

    Map<String, String> headers = {
      "Accept": "application/json",
      "Content-Type": "application/x-www-form-urlencoded",
    };

    if (accessToken != null && accessToken.isNotEmpty) {
      headers["Authorization"] = "Bearer $accessToken";

      print("AUTH TOKEN FOUND");
      print("TOKEN: $accessToken");
    } else {
      print("WARNING: ACCESS TOKEN IS NULL OR EMPTY");
    }

    print("URL : $path");
    print("BODY : $body");

    switch (method) {
      case "GET":
        response = await get(Uri.parse(path), headers: headers);
        break;

      case "POST":
        response = await post(Uri.parse(path), headers: headers, body: body);
        break;

      case "PUT":
        response = await put(Uri.parse(path), headers: headers, body: body);
        break;

      case "DELETE":
        response = await delete(Uri.parse(path), headers: headers, body: body);
        break;

      case "PATCH":
        response = await patch(Uri.parse(path), headers: headers, body: body);
        break;

      default:
        throw Exception("Invalid HTTP Method");
    }

    print("Status Code : ${response.statusCode}");
    print("Response : ${response.body}");

    if (response.statusCode >= 400) {
      log("$path : ${response.statusCode} : ${response.body}");

      throw ApiException(_decodeBodyBytes(response), response.statusCode);
    }

    return response;
  }

  Future<Response> invokeMultipartAPI(
    String path,
    String method,
    Map<String, String>? fields,
    List<MultipartFile>? files,
  ) async {
    final uri = Uri.parse(path);

    final request = MultipartRequest(method, uri);

    final prefs = await SharedPreferences.getInstance();

    String? accessToken = prefs.getString("accessToken");

    if (accessToken != null && accessToken.isNotEmpty) {
      request.headers["Authorization"] = "Bearer $accessToken";
    }

    if (fields != null) {
      request.fields.addAll(fields);
    }

    if (files != null) {
      request.files.addAll(files);
    }

    final streamedResponse = await request.send();

    final response = await Response.fromStream(streamedResponse);

    if (response.statusCode >= 400) {
      throw ApiException(_decodeBodyBytes(response), response.statusCode);
    }

    return response;
  }

  String _decodeBodyBytes(Response response) {
    final contentType = response.headers["content-type"];

    if (contentType != null && contentType.contains("application/json")) {
      final json = jsonDecode(response.body);

      return json["message"] ?? response.body;
    }

    return response.body;
  }
}
