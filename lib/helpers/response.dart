import 'package:dentsu_lms/constants/controllers.dart';
import 'package:dentsu_lms/models/session.dart';

abstract class LoginCallBack {
  void onSuccessLogin(Session session);
  void onLoginFailure(String error);
  void onLoginError(String error);
}

class LoginResponse {
  // ignore: prefer_final_fields
  LoginCallBack _callBack;
  // ignore: sort_constructors_first
  LoginResponse(this._callBack);
  // ignore: always_declare_return_types
  doLogin(String username, String password) async {
    final resp = await accountController.login(username, password);
    if (resp.containsKey('success')) {
      if (resp['success']) {
        final session = Session.fromMap(resp['data']);
        _callBack.onSuccessLogin(session);
      } else {
        _callBack.onLoginFailure(resp['message']);
      }
    } else {
      _callBack.onLoginError("Opps some error occurred");
    }
  }
}
