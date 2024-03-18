import 'dart:convert';

import 'package:dentsu_lms/constants/http.dart';
import 'package:dentsu_lms/models/session.dart';
import 'package:dentsu_lms/utilities/requests.dart';
import 'package:get/get.dart';

class AccountController extends GetxController {
  static AccountController instance = Get.find();
  Rx<Session> session = Rx<Session>(Session());

  // Getter method for accessing the session value
  Session get getSession => session.value;

  // Setter method for updating the session value
  set setSession(Session newSession) => session.value = newSession;

  Future login(String username, String password) async {
    var body = <String, String>{'username': username, 'password': password};
    final result = await postRequest(loginUrl, true, data: body);
    var convertDataToJson = jsonDecode(result.body);
    return convertDataToJson;
  }
}
