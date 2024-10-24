import 'package:countus/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final AuthRepository authRepository = Get.find();
  // Key untuk Form
  final formKey = GlobalKey<FormState>();

  // TextEditingController untuk email dan password
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Untuk toggle visibility password
  RxBool isPasswordHidden = true.obs;

  // Fungsi toggle untuk menyembunyikan atau menampilkan password
  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  // Fungsi untuk proses login (misalnya, menggunakan Firebase Authentication)
  void signIn(String email, String password) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        // Cek apakah email memuat '@'
        if (!email.contains('@')) {
          Get.snackbar(
            'Error',
            'Email harus memuat @',
            snackPosition: SnackPosition.BOTTOM,
          );
        } else {
          // Misalnya, jika menggunakan Firebase:
          // UserCredential userCredential = await FirebaseAuth.instance
          //     .signInWithEmailAndPassword(email: email, password: password);

          print("Login berhasil");
        }
      } else {
        Get.snackbar(
          'Error',
          'Email dan password tidak boleh kosong',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  void onClose() {
    // Bersihkan controller saat tidak lagi digunakan
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void signInWithEmailAndPassword(String email, String password) {
    authRepository.signInWithEmailAndPassword(email, password);
  }

  void createUserWithEmailAndPassword(String email, String password) {
    authRepository.createUserWithEmailAndPassword(email, password);
  }
}
