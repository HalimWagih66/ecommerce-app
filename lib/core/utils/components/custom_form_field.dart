import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
typedef FunctionValidate = String? Function(String?);
class CustomFormField extends StatelessWidget {
  TextEditingController inputField;
  FunctionValidate functionValidate;
  bool obscure_Text;
  TextInputType textInputType;
  String textLabel;
  IconData? prefix_Icon;
  IconData? suffix_Icon;
  String fontFamily;
  InputBorder? borderField;
  Function? onPressedsuffix_Icon;
  FunctionValidate? functionOcChanged;
  TextInputAction? textInputAction;
  String hintText;
  CustomFormField(
      {
        required this.hintText,
      required this.inputField,
      required this.functionValidate,
      this.obscure_Text = false,
      this.textInputType = TextInputType.text,
      required this.textLabel,
      this.prefix_Icon,
      this.suffix_Icon,
      this.fontFamily = "Poppins",
       this.borderField,
        this.onPressedsuffix_Icon,
        this.functionOcChanged,
        this.textInputAction
      });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(textLabel,style: Theme.of(context).textTheme.titleSmall),
        SizedBox(
          height: 24.h,
        ),
        TextFormField(
          keyboardType: textInputType,
          textInputAction: textInputAction,
          obscureText: obscure_Text,
          controller: inputField,
          validator: functionValidate,
          onChanged: functionOcChanged,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(color:Colors.black,fontSize: 20),
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            errorStyle: TextStyle(
              fontSize: 15.sp
            ),
            hintText: hintText,
            hintStyle: Theme.of(context).textTheme.bodySmall,
            enabledBorder:borderField?.copyWith(borderSide: BorderSide(width: 1,style: BorderStyle.solid,color: Colors.grey.shade300)),
            focusedBorder: borderField,
            errorBorder: borderField?.copyWith(borderSide: BorderSide(width: 1,style: BorderStyle.solid,color: Colors.red)),
            // prefixIcon: prefix_Icon != null ?Icon(
            //   prefix_Icon,color: Colors.grey,
            // ):null,

            suffixIcon: prefix_Icon != null?IconButton(
              onPressed: (){
                onPressedsuffix_Icon!();
              },
              icon: Icon(
                suffix_Icon,
                color: Colors.grey,
              )
            ):null
          ),
        ),
      ],
    );
  }
}
