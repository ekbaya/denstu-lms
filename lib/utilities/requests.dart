import 'dart:convert';
import 'dart:io';
import 'package:dentsu_lms/constants/controllers.dart';
import 'package:dentsu_lms/pages/login.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:path/path.dart';

Future<dynamic> getRequest(String url, bool firstAttempt,
    {String? keyword, int? page, int? limit}) async {
  // Constructing URL with optional query parameters
  String constructedUrl = url;
  if (keyword != null || page != null || limit != null) {
    constructedUrl += '?';
    if (keyword != null) {
      constructedUrl += 'keyword=$keyword&';
    }
    if (page != null) {
      constructedUrl += 'page=$page&';
    }
    if (limit != null) {
      constructedUrl += 'limit=$limit&';
    }
    // Remove the trailing '&' if any
    constructedUrl = constructedUrl.endsWith('&')
        ? constructedUrl.substring(0, constructedUrl.length - 1)
        : constructedUrl;
  }

  final result = await get(
    Uri.parse(constructedUrl),
    headers: {
      'Accept': 'Application/json',
      'Authorization':
          "Bearer ${firstAttempt ? accountController.session.value.token : accountController.session.value.refresh_token}",
    },
  );

  if (result.statusCode == 401 && firstAttempt) {
    // First attempt with token failed, try refreshing the token
    return getRequest(url, false, keyword: keyword, page: page, limit: limit);
  }

  if (result.statusCode == 401 && !firstAttempt) {
    // Refresh token failed, navigate to login page
    Get.to(const LoginPage(), preventDuplicates: true);
  }
  return result;
}

Future<dynamic> postRequest(String url, bool firstAttempt,
    {required Map<String, dynamic> data}) async {
  final result = await post(
    Uri.parse(url),
    body: jsonEncode(data),
    headers: {
      'Accept': 'Application/json',
      'Authorization':
          "Bearer ${firstAttempt ? accountController.session.value.token : accountController.session.value.refresh_token}",
    },
  );

  if (result.statusCode == 401 && firstAttempt) {
    // First attempt with token failed, try refreshing the token
    return postRequest(url, false, data: data);
  }

  if (result.statusCode == 401 && !firstAttempt) {
    // Refresh token failed, navigate to login page
    Get.to(const LoginPage(), preventDuplicates: true);
  }
  return result;
}

Future<dynamic> deleteRequest(String url, bool firstAttempt, String id) async {
  final result = await delete(
    Uri.parse(url + id),
    headers: {
      'Accept': 'Application/json',
      'Authorization':
          "Bearer ${firstAttempt ? accountController.session.value.token : accountController.session.value.refresh_token}",
    },
  );

  if (result.statusCode == 401 && firstAttempt) {
    // First attempt with token failed, try refreshing the token
    return deleteRequest(url, false, id);
  }

  if (result.statusCode == 401 && !firstAttempt) {
    // Refresh token failed, navigate to login page
    Get.to(const LoginPage(), preventDuplicates: true);
  }
  return result;
}

Future<dynamic> postFormRequest(String url, bool firstAttempt,
    {required File file, required String key}) async {
  Map<String, String> headers = {
    "Content-Type": "application/json",
    "Authorization":
        "Bearer ${firstAttempt ? accountController.session.value.token : accountController.session.value.refresh_token}"
  };

  var stream = http.ByteStream(Stream.castFrom(file.openRead()));
  var length = await file.length();

  var uri = Uri.parse(url);

  var request = http.MultipartRequest("POST", uri);

  var multipartFile =
      http.MultipartFile(key, stream, length, filename: basename(file.path));

  request.files.add(multipartFile);
  request.headers.addAll(headers);

  var result = await request.send();

  if (result.statusCode == 401 && firstAttempt) {
    // First attempt with token failed, try refreshing the token
    return postFormRequest(url, false, file: file, key: key);
  }

  if (result.statusCode == 401 && !firstAttempt) {
    // Refresh token failed, navigate to login page
    Get.to(const LoginPage(), preventDuplicates: true);
  }
  return http.Response.fromStream(result);
}
