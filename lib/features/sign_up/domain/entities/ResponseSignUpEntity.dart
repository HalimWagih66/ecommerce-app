import 'package:ecommerce/features/sign_up/domain/entities/response_user_entity.dart';

import 'RegisterErrorEntity.dart';


/// message : "success"
/// user : {"name":"Ahmed Abd Al-Muti","email":"ahmedmutti093988@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0Yzc1OTkwZDE0ODMyMDMzZDVlYTVmZiIsIm5hbWUiOiJBaG1lZCBBYmQgQWwtTXV0aSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNjkwNzg2MTkyLCJleHAiOjE2OTg1NjIxOTJ9.3tJkWMCVEGmsSzdBzZqid2yKUUuTfTCvCQfWBWy8Lec"

class ResponseSingUpEntity {
  ResponseSingUpEntity({
    this.message,
    this.user,
    this.token,
    this.statusMsg,
    this.error
  });

  String? statusMsg;
  String? message;
  ResponseUserEntity? user;
  String? token;
  SeverErrorEntity? error;

}