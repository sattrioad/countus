import 'package:countus/Screen/homepage.dart';
import 'package:countus/Screen/login/views/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthRepository extends GetxController {
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  RxBool isLoading = false.obs;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(const LoginScreen())
        : Get.offAll(const HomePage());
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      isLoading.value = true;
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.offAll(const HomePage());
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error', e.message.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.black.withOpacity(0.5),
          colorText: Colors.white);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      isLoading.value = true;
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      Get.offAll(const HomePage());
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error', e.message.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.black.withOpacity(0.5),
          colorText: Colors.white);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
