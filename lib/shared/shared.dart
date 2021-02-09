import 'package:shared_preferences/shared_preferences.dart';

class MySharedPreferences {
  Future setUserData(String otp, String apiToken, String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('otp', otp);
    prefs.setString('apiToken', apiToken);
    prefs.setString('id', id);
  }

  Future<String> getotp() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String otp = "";
    var otpval = prefs.getString('otp');
    if (otpval != '') {
      otp = otpval;
      return otp;
    } else {
      return otp;
    }
  }

  Future<String> gettoken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = "";
    var tokenval = prefs.getString('apiToken');
    if (tokenval != '') {
      token = tokenval;
      return token;
    } else {
      return token;
    }
  }

  Future<String> getid() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String id = "";
    var idval = prefs.getString('id');
    if (idval != '') {
      id = idval;
      return id;
    } else {
      return id;
    }
  }
}
