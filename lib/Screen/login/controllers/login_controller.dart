import 'package:countus/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final AuthRepository authRepository = Get.find();

  // TextEditingController untuk email dan password
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Untuk toggle visibility password
  RxBool isPasswordHidden = true.obs;

  // Fungsi toggle untuk menyembunyikan atau menampilkan password
  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  void signInWithEmailAndPassword(String email, String password) {
    authRepository.signInWithEmailAndPassword(email, password);
  }
}
