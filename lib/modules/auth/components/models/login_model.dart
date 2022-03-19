import 'package:get/get_rx/src/rx_types/rx_types.dart';

class LoginModel {
  final RxString email;
  final RxString password;

  LoginModel(String email, String passWord)
      : email = RxString(email),
        password = RxString(passWord);

  factory LoginModel.empty() => LoginModel('', '');

  bool get isEmpty => email.value.isEmpty || password.value.isEmpty;

  update(String email, String password) => this
    ..email.value = email
    ..password.value = password;

  Map<String, dynamic> toMap() => {
        'usr': email.value.trim(),
        'pwd': password.value,
      };
}
