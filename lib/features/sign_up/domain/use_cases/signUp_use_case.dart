import 'package:ecommerce/features/sign_up/domain/entities/ResponseSignUpEntity.dart';

import '../repositories/signUp_domain_repo.dart';

class SignUpUseCase{
  SignUpDomainRepo signUpDomainRepo;
  SignUpUseCase(this.signUpDomainRepo);
  Future<ResponseSingUpEntity>invoke(String name,String phone,String email,String password,String rePassword) =>signUpDomainRepo.signUp(name,phone,email,password,rePassword);
}