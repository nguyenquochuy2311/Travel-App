import 'dart:convert';

LoginResponseModel loginResponseJson(String str) => 
  LoginResponseModel.fromJson(json.decode(str));

class LoginResponseModel {
  LoginResponseModel({
    required this.acccessToken,
    required this.refreshToken,
  });
  late final String acccessToken;
  late final String refreshToken;
  
  LoginResponseModel.fromJson(Map<String, dynamic> json){
    acccessToken = json['acccessToken'];
    refreshToken = json['refreshToken'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['acccessToken'] = acccessToken;
    _data['refreshToken'] = refreshToken;
    return _data;
  }
}