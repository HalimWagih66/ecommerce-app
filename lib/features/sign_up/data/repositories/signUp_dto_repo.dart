import 'package:ecommerce/features/sign_up/domain/entities/ResponseSignUpEntity.dart';

import '../../domain/repositories/signUp_domain_repo.dart';
import '../../domain/signUp_data_source/signUp_data_source.dart';

class SignUpDtoRepo implements SignUpDomainRepo{
  SignUpDataSource signUpDataSource;
  SignUpDtoRepo(this.signUpDataSource);
  @override
  Future<ResponseSingUpEntity> signUp(String name,String phone,String email,String password,String rePassword)=>signUpDataSource.signUp(name, phone, email, password, rePassword);

}