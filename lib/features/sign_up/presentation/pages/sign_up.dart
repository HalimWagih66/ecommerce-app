import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/utils/app_images.dart';
import 'package:ecommerce/core/utils/components/custom_form_field.dart';
import 'package:ecommerce/features/sign_up/presentation/manager/cubit.dart';
import 'package:ecommerce/features/sign_up/presentation/manager/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/components/dialog.dart';
import '../../../../core/utils/validation_email.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {


  bool isPasswordLowerCase = false;

  bool isPasswordUpperCase = false;

  bool isPasswordNumericNumber = false;

  bool isPasswordSpecialCharacter = false;

  bool isPassword8Character = false;

  var formKey = GlobalKey<FormState>();

  SignUpCubit signUpCubit = SignUpCubit();

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit,SignUpState>(
      bloc: signUpCubit,
      listenWhen: (previous, current) {
        if(previous is SignUpLoadingState){
          DialogUtils.hideDialog(context);
        }
        if (current is SignUpLoadingState ||
            current is SignUpSuccessState || current is SignUpFailState){
          return true;
        }
        return false;
      },
      listener: (context,state) {
        if(state is SignUpFailState){
          DialogUtils.showMessage(context: context, message: state.errorMessage?? state.ex?.toString() ??"Something Went Wrong", dialogType: DialogType.error,nigActionName: "Ok",nigAction: (){
          });
        }
        if(state is SignUpLoadingState){

          DialogUtils.dialogLoading(context);
        }
        if(state is SignUpSuccessState){
          DialogUtils.showMessage(context: context,title: "Success", message: "You have been successfully registered, my dear", dialogType: DialogType.success,nigActionName: "Ok",nigAction: (){
          });
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(height: 85.h),
                  Image.asset(AppImages.logoApp),
                  SizedBox(height: 46.h),
                  Row(
                    children: [
                      Expanded(
                        child: CustomFormField(
                            textInputAction: TextInputAction.next,
                            inputField: signUpCubit.firstNameController,
                            hintText: "enter your first name",
                            functionValidate: (text){
                              if (text == null || text?.trim().isEmpty == true) {
                                return "Please Enter Your first name";
                              }
                            },
                            borderField: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(15)),
                                borderSide: BorderSide(color: Colors.blue,
                                    style: BorderStyle.solid,
                                    width: 2)
                            ),
                            textLabel: "First Name"
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width*0.05),
                      Expanded(
                        child: CustomFormField(
                            textInputAction: TextInputAction.next,
                          hintText: "enter your last name",
                            inputField: signUpCubit.lastNameController,
                            functionValidate: (text){
                              if (text == null || text?.trim().isEmpty == true) {
                                return "Please Enter Your Last Name";
                              }
                            },
                            borderField: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                                borderSide: BorderSide(color: Colors.blue,
                                    style: BorderStyle.solid,
                                    width: 2)
                            ),
                            textLabel: "Last Name"
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  CustomFormField(
                      hintText: "enter your mobile no.",
                      inputField: signUpCubit.phoneController,
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.number,
                      functionValidate: (text){
                        if (text == null || text?.trim().isEmpty == true) {
                          return "Please Enter Your number correctly";
                        }
                        if (text.length < 11) {
                          return "Please enter the phone number correctly";
                        }
                      },
                      borderField: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(color: Colors.blue,
                              style: BorderStyle.solid,
                              width: 2)
                      ),
                      textLabel: "Mobile Number"
                  ),
                  SizedBox(height: 24.h),
                  CustomFormField(
                    textInputType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    hintText: "enter your email address",
                      inputField: signUpCubit.emailController,
                      functionValidate: (text){
                        if (text == null || text?.trim().isEmpty == true) {
                          return "Please Enter Your Mail";
                        }
                        if (!ValidationEmail.validateEmail(text)) {
                          return "please enter Valid Mail";
                        }
                      },
                      borderField: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(color: Colors.blue,
                              style: BorderStyle.solid,
                              width: 2)
                      ),
                      textLabel: "E-mail address"
                  ),
                  SizedBox(height: 24.h),
                  CustomFormField(
                    obscure_Text: true,
                      textInputType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.next,
                    hintText: "enter your password",
                      inputField: signUpCubit.passwordController,
                      functionValidate: (text){
                        if (text == null || text?.trim().isEmpty == true) {
                          return "Please Enter Your Password";
                        }
                        if (signUpCubit.passwordController.text.length < 7) {
                          return "please enter Valid password";
                        }
                      },
                      // functionOcChanged: (text) {
                      // //if(text == null)return;
                      // if(ValidationPassword.validatePasswordUppercase(passwordController.text) == true && isPasswordUpperCase == false){
                      //   print("w");
                      //   isPasswordUpperCase = true;
                      //   setState(() {
                      //
                      //   });
                      // }
                      // if(ValidationPassword.validatePasswordLowercase(passwordController.text) == true && isPasswordLowerCase == false){
                      //   isPasswordLowerCase = true;
                      //   setState(() {
                      //   });
                      // }if(ValidationPassword.validatePasswordNumericNumber(passwordController.text) == true && isPasswordNumericNumber == false){
                      //   isPasswordNumericNumber = true;
                      //   setState(() {
                      //
                      //   });
                      // }
                      // if(ValidationPassword.validatePasswordSpecialCharacter(passwordController.text) == true && isPasswordSpecialCharacter == false){
                      //   isPasswordSpecialCharacter = true;
                      //   setState(() {
                      //
                      //   });
                      // }
                      // if(ValidationPassword.validatePassword8Character(passwordController.text)== true && isPassword8Character == false){
                      //   isPassword8Character = true;
                      //   setState(() {
                      //
                      //   });
                      // }
                      // },
                      borderField: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(color: Colors.blue,
                              style: BorderStyle.solid,
                              width: 2)
                      ),
                      textLabel: "Password"
                  ),
                  SizedBox(height: 20.h),
                  /*Row(
                    children: [
                      isPasswordUpperCase?const Icon(Icons.check_circle_outline,color: Colors.green,):const Icon(Icons.highlight_off,color: Colors.red,),
                      SizedBox(width: 10.w),
                      Text("should contain at least one upper case",style: Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 13))
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      isPasswordUpperCase?const Icon(Icons.check_circle_outline,color: Colors.green,):const Icon(Icons.highlight_off,color: Colors.red,),
                      SizedBox(width: 10.w),
                      Text("should contain at least one lower case",style: Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 13))
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      isPasswordNumericNumber?const Icon(Icons.check_circle_outline,color: Colors.green,):const Icon(Icons.highlight_off,color: Colors.red,),
                      SizedBox(width: 10.w),
                      Text("should contain at least one digit",style: Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 13))
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      isPasswordSpecialCharacter?const Icon(Icons.check_circle_outline,color: Colors.green,):const Icon(Icons.highlight_off,color: Colors.red,),
                      SizedBox(width: 10.w),
                      Text("should contain at least one Special character",style: Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 13))                  ],
                  ),*/
                 // SizedBox(height: 10.h),
                 //  Row(
                 //    children: [
                 //      isPassword8Character?const Icon(Icons.check_circle_outline,color: Colors.green,):const Icon(Icons.highlight_off,color: Colors.red,),
                 //      SizedBox(width: 10.w),
                 //      Text("Must be at least 8 characters in length",style: Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 13))                  ],
                 //  ),
                  SizedBox(height: 24.h),
                  CustomFormField(
                      obscure_Text: true,
                      textInputType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.next,
                    hintText: "enter your Re-password",
                      inputField: signUpCubit.rePasswordController,
                      functionValidate: (text){
                        if (text == null || text?.trim().isEmpty == true) {
                          return "Please Enter Your Re-Password";
                        }
                        if (text != signUpCubit.passwordController.text) {
                          return "Password not matched";
                        }
                      },
                      borderField: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(color: Colors.blue,
                              style: BorderStyle.solid,
                              width: 2)
                      ),
                      textLabel: "Re-Password"
                  ),
                  SizedBox(height: 56.h),
                  ElevatedButton(onPressed: (){
                    register();
                  }, child: Text("Sign up",style: Theme.of(context).textTheme.bodyMedium),style: ElevatedButton.styleFrom(backgroundColor: Colors.white,elevation: 40,fixedSize: const Size(368, 64),shape: const RoundedRectangleBorder(borderRadius:BorderRadius.all(Radius.circular(15))))),
                  SizedBox(height: 89.h),
                ],
              ),
            ),
          ),
        )
      ),
    );
  }

  void register(){
    if(formKey.currentState?.validate() == false)return;
    signUpCubit.signUp();
  }
}
