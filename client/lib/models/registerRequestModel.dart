import 'dart:convert';

RegisterRequestModel registerRequestModel(String str) => 
  RegisterRequestModel.fromJson(json.decode(str));

class RegisterRequestModel {
  RegisterRequestModel({
    required this.fullname,
    required this.email,
    required this.phone,
    required this.password,
    required this.roleId,
  });
  late final String fullname;
  late final String email;
  late final String phone;
  late final String password;
  late final int roleId;
  
  RegisterRequestModel.fromJson(Map<String, dynamic> json){
    fullname = json['fullname'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
    roleId = json['role_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['fullname'] = fullname;
    _data['email'] = email;
    _data['phone'] = phone;
    _data['password'] = password;
    _data['role_id'] = roleId;
    return _data;
  }
}