import 'package:countus/Screen/homepage.dart';
import 'package:countus/Screen/login/views/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthRepository extends GetxController {
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

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
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.offAll(const HomePage());
    } catch (e) {
      throw const Text("Error In Repository");
    }
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      Get.offAll(const HomePage());
    } catch (e) {
      throw const Text("Error In Repository");
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
  }
}
