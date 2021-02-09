import 'dart:convert';

import 'package:fitmemax/constance/constance.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  Future userLogin(String email, String password) async {
    var result;
    try {
      var urlString = ConstanceData.BaseApiUrl + "user/user-login";
      var response = await http.post(
        Uri.encodeFull(urlString),
        headers: {
          "Accept": "application/json",
        },
        body: {
          "email": email.trim(),
          "password": password.trim(),
        },
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data != null) {
          result = data;
        }
      } else {
        return null;
      }
    } catch (e) {
      print(e);
    }
    return result;
  }

  Future userRegistration(String email, String name, String password, String mobile) async {
    var result;
    try {
      var urlString = ConstanceData.BaseApiUrl + "user/user-registration";
      var response = await http.post(
        Uri.encodeFull(urlString),
        headers: {
          "Accept": "application/json",
        },
        body: {
          "email": email.trim(),
          "name": name.trim(),
          "password": password.trim(),
          "mobile": mobile.trim(),
        },
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data != null) {
          result = data;
        }
      } else {
        return null;
      }
    } catch (e) {
      print(e);
    }
    return result;
  }

  Future usersVerify(String token, String otp) async {
    var result;
    try {
      var urlString = ConstanceData.BaseApiUrl + "user/verify-otp";
      var response = await http.post(
        Uri.encodeFull(urlString),
        headers: {
          "Accept": "application/json",
        },
        body: {
          "token": token.trim(),
          "otp": otp.trim(),
        },
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data != null) {
          result = data;
        }
      } else {
        return null;
      }
    } catch (e) {
      print(e);
    }
    return result;
  }

  Future usersResendOtp(String token) async {
    var result;
    try {
      var urlString = ConstanceData.BaseApiUrl + "user/resend-otp";
      var response = await http.post(
        Uri.encodeFull(urlString),
        headers: {
          "Accept": "application/json",
        },
        body: {
          "token": token.trim(),
        },
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data != null) {
          result = data;
        }
      } else {
        return null;
      }
    } catch (e) {
      print(e);
    }
    return result;
  }
}
