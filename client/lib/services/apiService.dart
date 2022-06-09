import 'dart:developer' as developer;
import 'dart:convert';

import 'package:client/config/authServer.dart';
import 'package:client/models/loginRequestModel.dart';
import 'package:client/models/loginResponseModel.dart';
import 'package:client/models/registerResponseModel.dart';
import 'package:client/models/registerRequestModel.dart';
import 'package:client/services/sharedService.dart';
import 'package:http/http.dart' as http;

class APIService {
  static var client = http.Client();

  static Future<bool> login(LoginRequestModel model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(AuthConfig.apiUrl, AuthConfig.signInAPI);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson())
    );

    if(response.statusCode == 200) {
      await SharedService.setLoginDetails(loginResponseJson(response.body));
      developer.log('OK');
      return true;
    }
    return false;
  }

  static Future<RegisterResponseModel> register(RegisterRequestModel model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(AuthConfig.apiUrl, AuthConfig.signUpAPI);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson())
    );

   return registerResponseModel(response.body);
  }
}