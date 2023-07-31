import 'package:ecommerce/features/sign_up/domain/entities/ResponseSignUpEntity.dart';

abstract class SignUpDomainRepo{
   Future<ResponseSingUpEntity>signUp(String name,String phone,String email,String password,String rePassword);
}