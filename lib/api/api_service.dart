import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:halopantai/model/login_response.dart';
import 'package:halopantai/model/service.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static const baseUrl = 'https://review-pantai.herokuapp.com/api/';

  static Future<Object> register(
      String name, String email, String password) async {
    var url = Uri.parse(baseUrl + 'registerAPI');

    try {
      var response = await http.post(url, headers: {
        'content-type': 'application/x-www-form-urlencoded',
      }, body: {
        'email': email,
        'password': password,
        'name': name,
      });

      debugPrint(response.statusCode.toString());

      if (response.statusCode >= 200 && response.statusCode < 300) {
        var result = json.decode(response.body);
        var user = User.fromJson(result);

        return ServicesSuccess(
            code: response.statusCode, msg: "Fetch Sucess", data: user);
      } else {
        return ServicesFailure(code: 404, errMsg: "Fetch data failed");
      }
    } on HttpException {
      return ServicesFailure(code: 101, errMsg: "No Internet Conecction!");
    } catch (e) {
      return ServicesFailure(code: 102, errMsg: "Unknown Error!");
    }
  }

  static Future<Object> login(String email, String password) async {
    var url = Uri.parse(baseUrl + 'login');

    try {
      var response = await http.post(url, headers: {
        'content-type': 'application/x-www-form-urlencoded'
      }, body: {
        'email': email,
        'password': password,
      });

      debugPrint(response.statusCode.toString());
      debugPrint(response.body);

      if (response.statusCode == 200) {
        var result = json.decode(response.body);
        var loginResponse = LoginResponse.fromJson(result);

        debugPrint(loginResponse.success.toString());

        return ServicesSuccess(
            code: response.statusCode,
            data: loginResponse,
            msg: 'Fetch Success');
      } else {
        debugPrint('fetch failed');
        return ServicesFailure(code: 404, errMsg: "Fetch data Failed");
      }
    } on HttpException {
      return ServicesFailure(code: 101, errMsg: "No Internet Conecction!");
    } catch (e) {
      return ServicesFailure(code: 102, errMsg: "Unknown Error!");
    }
  }
}
