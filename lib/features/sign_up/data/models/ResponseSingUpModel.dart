import '../../domain/entities/ResponseSignUpEntity.dart';
import 'RegisterError.dart';
import 'response_user_model.dart';

/// message : "success"
/// user : {"name":"Ahmed Abd Al-Muti","email":"ahmedmutti093988@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0Yzc1OTkwZDE0ODMyMDMzZDVlYTVmZiIsIm5hbWUiOiJBaG1lZCBBYmQgQWwtTXV0aSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNjkwNzg2MTkyLCJleHAiOjE2OTg1NjIxOTJ9.3tJkWMCVEGmsSzdBzZqid2yKUUuTfTCvCQfWBWy8Lec"

class ResponseSingUpModel {
  ResponseSingUpModel({
      this.message, 
      this.user, 
      this.token,
    this.error,
    this.statusMsg
  });

  ResponseSingUpModel.fromJson(dynamic json) {
    message = json['message'];
    statusMsg = json['statusMsg'];
    user = json['user'] != null ? ResponseUserModel.fromJson(json['user']) : null;
    token = json['token'];
    error = json['errors'] != null ? SeverError.fromJson(json['errors']) : null;
  }
  String? message;
  ResponseUserModel? user;
  SeverError? error;
  String? statusMsg;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }

  ResponseSingUpEntity toResponseSingUpEntity(){
    return ResponseSingUpEntity(
      user: user?.tpResponseUserEntity(),
      token: token,
      message: message,
      statusMsg: statusMsg,
      error: error?.toSeverErrorEntity()
    );
  }
  bool isSuccess(){
    return statusMsg != "fail" && error == null;
  }
  String? getErrorMessage(){
    return message == "fail"? error?.msg??"":message;
  }
}