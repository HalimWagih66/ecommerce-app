import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:ecommerce/core/utils/constants.dart';
import 'package:ecommerce/features/sign_up/domain/custome_Exceptions/network%20_exception.dart';
import 'package:ecommerce/features/sign_up/domain/custome_Exceptions/server_exception.dart';
import 'package:ecommerce/features/sign_up/domain/entities/ResponseSignUpEntity.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/intercepted_client.dart';
import '../../../../core/api/end_point.dart';
import '../../../../core/api/interceptor.dart';
import '../../domain/signUp_data_source/signUp_data_source.dart';
import '../models/ResponseSingUpModel.dart';

class SignUpDataSourceOnline implements SignUpDataSource{
  @override
  http.Client client = InterceptedClient.build(interceptors: [
    LoggingInterceptor(),
  ]);

  @override
  Future<ResponseSingUpEntity> signUp(String name,String phone,String email,String password,String rePassword)async {
    try {
      var url = Uri.https(baseApiUrl,EndPoints.signUp);
      print({"name": name,
        "email": email,
        "password": password,
        "rePassword": rePassword,
        "phone": phone});
      var response = await client.post(url,body: {
        "name":name,
        "email":email,
        "password":password,
        "rePassword":rePassword,
        "phone":phone
      });
      ResponseSingUpModel responseSingUpModel = ResponseSingUpModel.fromJson(jsonDecode(response.body));
      if(!responseSingUpModel.isSuccess()){
        throw ServerException(
          errorMessage: responseSingUpModel.getErrorMessage(),
          //statusMessage: responseSingUpModel.statusMsg,
          httpResponseCode: response.statusCode
        );
      }
      return responseSingUpModel.toResponseSingUpEntity();
    } on TimeoutException catch (e) {
      throw NetworkException("TimeOut: Please check internet connection");
    }on HttpException catch(e){
      throw NetworkException("http exception: "
          "couldn't reach server");
    }
  }

}