class ValidationPassword{
  static bool validatePassword(String value){
    RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    return regex.hasMatch(value);
  }
  static bool validatePasswordUppercase(String value){
    RegExp regex = RegExp(r'(?=.*[A-Z])$');
    print(regex.hasMatch(value));
    return regex.hasMatch(value);
    // return true;
  }
  static bool validatePasswordLowercase(String value){
    RegExp regex = RegExp(r'(?=.*[a-z])$');
    print(regex.hasMatch(value));
    return regex.hasMatch(value);
    //return true;
  }
  static bool validatePasswordNumericNumber(String value){
    RegExp regex = RegExp(r'^(?=.*?[0-9])$');
    print(regex.hasMatch(value));
    return regex.hasMatch(value);
  }
  static bool validatePasswordSpecialCharacter(String value){
    RegExp regex = RegExp(r'^(?=.*?[!@#\$&*~])$');
    print(regex.hasMatch(value));
    return regex.hasMatch(value);
  }
  static bool validatePassword8Character(String value){
    RegExp regex = RegExp(r'^.{8,}$');
    print(regex.hasMatch(value));
    return regex.hasMatch(value);
  }
}