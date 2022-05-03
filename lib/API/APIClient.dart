import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class APIClient {

  String apiRoot = "https://fitmemax.com/api";

  _buildHeader(){
    return { 'Accept' : 'application/json', 'cache-control' : 'no-cache'};
  }

  _buildHeaderWithAuth() async {
    final currentAPIToken = await getApiToken();
    return { 'Accept' : 'application/json', 'authorization' : 'Bearer '+currentAPIToken, 'cache-control' : 'no-cache'};
  }

  Future<Map<String, dynamic>> authRequest(String email, String password) async {
    final body = {
      "email": email,
      "password": password
    };
    final response = await http.post(apiRoot+"/sign-in", headers: _buildHeader(), body: body);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load post');
    }
  }

  Future<Map<String, dynamic>> socialLogin(body) async {
    final response = await http.post(apiRoot+"/social-login", headers: _buildHeader(), body: body);
    debug(response.body);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load post');
    }
  }

  Future<Map<String, dynamic>> getProfileStatus(data) async {
    final response = await http.get(apiRoot+"/get-profile-status?id="+data, headers: _buildHeader());
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load post');
    }
  }

  Future<Map<String, dynamic>> signUp(data) async {
    final response = await http.post(apiRoot+"/sign-up", headers: _buildHeader(), body: data);
    this.debug(response.body);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load post');
    }
  }

  Future<Map<String, dynamic>> sendOTP(data) async {
    final response = await http.post(apiRoot+"/resend-otp", headers: _buildHeader(), body: data);
    this.debug(response.body);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load post');
    }
  }

  Future<Map<String, dynamic>> storePhysicalCondition(data) async {
    final response = await http.post(apiRoot+"/store-physical-condition", headers: _buildHeader(), body: data);
    debug(response.body);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load post');
    }
  }

  Future<Map<String, dynamic>> getMedicalConditionMaster() async {
    final response = await http.get(apiRoot+"/get-medical-condition", headers: _buildHeader());
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load post');
    }
  }

  Future<Map<String, dynamic>> storeMedicalCondition(data) async {
    final response = await http.post(apiRoot+"/store-medical-condition", headers: _buildHeader(), body: data);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load post');
    }
  }

  Future<Map<String, dynamic>> removeMedicalCondition(data) async {
    final response = await http.post(apiRoot+"/remove-medical-condition", headers: _buildHeader(), body: data);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load post');
    }
  }

  Future<Map<String, dynamic>> getGoalMaster() async {
    final response = await http.get(apiRoot+"/get-goal", headers: _buildHeader());
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load post');
    }
  }

  Future<Map<String, dynamic>> storeGoal(data) async {
    final response = await http.post(apiRoot+"/store-goal", headers: _buildHeader(), body: data);
    this.debug(response.body);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load post');
    }
  }

  Future<Map<String, dynamic>> removeGoal(data) async {
    final response = await http.post(apiRoot+"/remove-goal", headers: _buildHeader(), body: data);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load post');
    }
  }

  Future<Map<String, dynamic>> finishRegistration(data) async {
    final response = await http.post(apiRoot+"/finish-registration", headers: _buildHeader(), body: data);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load post');
    }
  }

  Future<Map<String, dynamic>> changePassword(currentPassword, newPassword) async {
    final body = {
      "old_password": currentPassword,
      "password": newPassword
    };
    final authHeader = await _buildHeaderWithAuth();
    final response = await http.post(apiRoot+"/member/change-password", headers: authHeader, body: body);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load post');
    }
  }

  Future<Map<String, dynamic>> isMedicalConditionSet(data) async {
    final response = await http.post(apiRoot+"/is-medicalcondition-set", headers: _buildHeader(), body: data);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load post');
    }
  }

  Future<Map<String, dynamic>> isGoalSet(data) async {
    final response = await http.post(apiRoot+"/is-goal-set", headers: _buildHeader(), body: data);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load post');
    }
  }

  getApiToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.get('api_token');
  }

  success(msg){
    Fluttertoast.showToast(
        msg: msg, toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.BOTTOM, timeInSecForIosWeb: 1, backgroundColor: Colors.green, textColor: Colors.white, fontSize: 16.0
    );
  }

  error(msg){
    Fluttertoast.showToast(
        msg: msg, toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.BOTTOM, timeInSecForIosWeb: 1, backgroundColor: Colors.red, textColor: Colors.white, fontSize: 16.0
    );
  }

  storeLocal(mobile, id, email, api_token, name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('is_login', true);
    await prefs.setInt('id', id);
    await prefs.setString('mobile', mobile);
    await prefs.setString('name', name);
    await prefs.setString('email', email);
    await prefs.setString('api_token', api_token);
  }

  getLocal() async {
    final prefs = await SharedPreferences.getInstance();
    final mobile = prefs.get('mobile');
    final email = prefs.get('email');
    final id = prefs.get('id');
    final api_token = prefs.get('api_token');
    final name = prefs.get('name');
    return { 'mobile' : mobile, 'email':email, 'id' : id, 'api_token' : api_token, 'name' :  name};
  }

  isLogin() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey('is_login');
  }

  logOut() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('mobile');
    prefs.remove('email');
    prefs.remove('id');
    prefs.remove('api_token');
    prefs.remove('is_login');
    return true;
  }


  debug(data){
    print(data);
  }

}