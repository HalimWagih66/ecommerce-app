import 'package:ecommerce/features/sign_up/domain/entities/ResponseSignUpEntity.dart';

abstract class SignUpDataSource{
  Future<ResponseSingUpEntity>signUp(String name,String phone,String email,String password,String rePassword);
}