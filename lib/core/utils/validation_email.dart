class ValidationEmail{
  static bool validateEmail(String email){

    return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@gmail+\.com+")
        .hasMatch(email);
  }

}