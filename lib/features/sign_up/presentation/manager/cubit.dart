import 'package:bloc/bloc.dart';
import 'package:ecommerce/features/sign_up/data/repositories/signUp_dto_repo.dart';
import 'package:ecommerce/features/sign_up/domain/custome_Exceptions/network%20_exception.dart';
import 'package:ecommerce/features/sign_up/domain/custome_Exceptions/server_exception.dart';
import 'package:ecommerce/features/sign_up/domain/entities/ResponseSignUpEntity.dart';
import 'package:ecommerce/features/sign_up/domain/repositories/signUp_domain_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce/features/sign_up/presentation/manager/states.dart';
import 'package:flutter/material.dart';

import '../../data/data_sources/signUp_data_source_online.dart';
import '../../domain/signUp_data_source/signUp_data_source.dart';
import '../../domain/use_cases/signUp_use_case.dart';


class SignUpCubit extends Cubit<SignUpState>{

  SignUpCubit():super(SignUpInitState());

  TextEditingController firstNameController = TextEditingController(text: "halim");

  TextEditingController lastNameController = TextEditingController(text: "wagih");

  TextEditingController emailController = TextEditingController(text: "halemwagih33@gmail.com");

  TextEditingController phoneController = TextEditingController(text: "01204956203");

  TextEditingController passwordController = TextEditingController(text: "halemwagih33");

  TextEditingController rePasswordController = TextEditingController(text: "halemwagih33@");

  //static SignUpCubit get(context) => BlocProvider.of(context);

  signUp()async{
    emit(SignUpLoadingState());
    try {
      SignUpDataSource source = SignUpDataSourceOnline();
      SignUpDomainRepo signUpDomainRepo = SignUpDtoRepo(source);
      SignUpUseCase signUpUseCase = SignUpUseCase(signUpDomainRepo);
      String name = "${firstNameController.text} ${lastNameController.text}";
      print(name);
      ResponseSingUpEntity result = await source.signUp(
          name,
          phoneController.text,
          emailController.text,
          passwordController.text,
          rePasswordController.text
      );
      emit(SignUpSuccessState(result));
    } on ServerException catch (ex) {
      emit(SignUpFailState(errorMessage: ex.errorMessage,ex: ex));
    } on NetworkException catch (ex){
      emit(SignUpFailState(errorMessage: "Please check your internet connection",ex: ex));
    }

  }
}