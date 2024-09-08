import 'package:flutter/cupertino.dart';
import 'package:lavenda/Controller/UserController/user_controller.dart';

class RegisterServices {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  UserController userController = UserController();
  //Future<bool> registerUserToFirebase(String email, String password) {}
}
