import '../../domain/custome_Exceptions/server_exception.dart';
import '../../domain/entities/ResponseSignUpEntity.dart';

abstract class SignUpState{}

class SignUpInitState implements SignUpState{}

class SignUpLoadingState implements SignUpState{}

class SignUpFailState implements SignUpState{
  String? errorMessage;
  Exception? ex;
  SignUpFailState({this.errorMessage, this.ex});
}

class SignUpSuccessState implements SignUpState{
  ResponseSingUpEntity responseSingUpEntity;
  SignUpSuccessState(this.responseSingUpEntity);
}