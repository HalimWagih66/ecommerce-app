import 'package:ecommerce/features/sign_up/domain/entities/response_user_entity.dart';

import '../../domain/entities/ResponseSignUpEntity.dart';

/// name : "Ahmed Abd Al-Muti"
/// email : "ahmedmutti093988@gmail.com"
/// role : "user"

class ResponseUserModel {
  ResponseUserModel({
      this.name, 
      this.email, 
      this.role,});

  ResponseUserModel.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }
  String? name;
  String? email;
  String? role;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['role'] = role;
    return map;
  }
  ResponseUserEntity tpResponseUserEntity(){
    return ResponseUserEntity(
      role: role,
      email: email,
      name: name
    );
  }

}