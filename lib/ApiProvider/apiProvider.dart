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
      // var urlString = "http://project.neutronvision.com/fitBook/public/api/v1/user/user-registration";
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

  Future userPhysicalCondition(
    String age,
    String height,
    String weight,
    String bloodGroup,
    String gender,
    String apiToken,
  ) async {
    var result;
    try {
      var urlString = ConstanceData.BaseApiUrl2 + "physical-condition";
      var response = await http.post(
        Uri.encodeFull(urlString),
        headers: {
          "Accept": "application/json",
        },
        body: {
          "age": age,
          "height": height,
          "weight": weight,
          "blood_group": bloodGroup,
          "gender": gender,
          "api_token": apiToken,
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

  Future userMedicalCondition(String medicalId, String apiToken) async {
    var result;
    try {
      var urlString = ConstanceData.BaseApiUrl2 + "medical-condition";
      var response = await http.post(
        Uri.encodeFull(urlString),
        headers: {
          "Accept": "application/json",
        },
        body: {
          "medical_id": medicalId,
          "api_token": apiToken,
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

  Future getUserMedicalCondition() async {
    var result;
    try {
      var urlString = ConstanceData.BaseApiUrl2 + "get-medical-condition";
      var response = await http.get(
        Uri.encodeFull(urlString),
        headers: {
          "Accept": "application/json",
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

  Future getGoalDetailList() async {
    var result;
    try {
      var urlString = ConstanceData.BaseApiUrl2 + "get-goal";
      var response = await http.get(
        Uri.encodeFull(urlString),
        headers: {
          "Accept": "application/json",
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

  Future userGoal(String goalId, String apiToken) async {
    var result;
    try {
      var urlString = ConstanceData.BaseApiUrl2 + "goal";
      var response = await http.post(
        Uri.encodeFull(urlString),
        headers: {
          "Accept": "application/json",
        },
        body: {
          "goal_id'": goalId,
          "api_token": apiToken,
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

  Future getUserGoal() async {
    var result;
    try {
      var urlString = ConstanceData.BaseApiUrl2 + "get-goal";
      var response = await http.get(
        Uri.encodeFull(urlString),
        headers: {
          "Accept": "application/json",
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

  // Slider Detail
  Future getsliders() async {
    var result;
    try {
      var urlString = ConstanceData.BaseApiUrl + "get-sliders";
      var response = await http.get(Uri.encodeFull(urlString), headers: {
        "Accept": "application/json",
      });
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

  // Categories Detail
  Future getCategories() async {
    var result;
    try {
      var urlString = ConstanceData.BaseApiUrl + "get-categories";
      var response = await http.get(Uri.encodeFull(urlString), headers: {
        "Accept": "application/json",
      });
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

  Future getSubCategories(String categoryId) async {
    var result;
    try {
      var urlString = ConstanceData.BaseApiUrl + "get-sub-categories" + categoryId;
      var response = await http.get(Uri.encodeFull(urlString), headers: {
        "Accept": "application/json",
      });
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

  // Blog Detail
  Future getBlogs() async {
    var result;
    try {
      var urlString = ConstanceData.BaseApiUrl + "get-blogs";
      var response = await http.get(Uri.encodeFull(urlString), headers: {
        "Accept": "application/json",
      });
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

  Future getBlogDetail(String blogId) async {
    var result;
    try {
      var urlString = ConstanceData.BaseApiUrl + "blog-details/$blogId";
      var response = await http.get(Uri.encodeFull(urlString), headers: {
        "Accept": "application/json",
      });
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
