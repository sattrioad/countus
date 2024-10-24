import 'package:countus/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

class SignupControllers {
  final AuthRepository authRepository = Get.find();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void createUserWithEmailAndPassword(String email, String password) {
    authRepository.createUserWithEmailAndPassword(email, password);
  }
}
