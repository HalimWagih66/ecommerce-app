import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DialogUtils {
  static dialogLoading(BuildContext context) {
   // var appProvider = Provider.of<ApplicationProvider>(context,listen: false);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          content: Row(
            children: [
              const CircularProgressIndicator(),
              SizedBox(width: 14.w),
              const Text("Loading")
            ],
          ),
        );
      },
      barrierDismissible: false,
    );
  }

  static hideDialog(BuildContext context) {
    Navigator.pop(context);
  }

  static showMessage({
    required BuildContext context,
    required String message,
    required DialogType dialogType,
    String? title,
    String? posActionName,
    Function? posAction,
    String? nigActionName,
    Function? nigAction,
  }) {
    AwesomeDialog(
      dismissOnTouchOutside: false,
      dialogBackgroundColor:Colors.white,
      context: context,
      dialogType: dialogType,
      title: title,
      titleTextStyle: Theme.of(context).textTheme.bodyLarge,
      animType: AnimType.rightSlide,
      desc: message,
      btnCancelOnPress: nigActionName != null
          ? () {
        nigAction?.call();
      }
          : null,
      btnOkOnPress: posActionName != null
          ? () {
        posAction?.call();
      }
          : null,
      btnOkText: posActionName,
      btnCancelText: nigActionName,
    )..show();
  }
}
