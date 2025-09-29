class Validations {

  static bool emailValidator(String email){
    bool emailValid = RegExp(r'^.+0[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(email);
    return emailValid;
  }
}