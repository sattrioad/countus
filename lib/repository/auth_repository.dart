import 'package:countus/Screen/homepage.dart';
import 'package:countus/Screen/login/views/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthRepository extends GetxController {
  late final Rx<User?> firebaseUser;

  get currentUser => FirebaseAuth.instance.currentUser;

  RxBool isLoading = false.obs;

  //bikin app ga minta login terus
  @override
  void onReady() {
    firebaseUser = Rx<User?>(FirebaseAuth.instance.currentUser);
    firebaseUser.bindStream(FirebaseAuth.instance.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(const LoginScreen())
        : Get.offAll(const HomePage());
  }

  //login dengan firebase
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      isLoading.value = true;

      //fungsi
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);

      //pindah
      Get.offAll(const HomePage());

    } on FirebaseAuthException catch (e) {

      //kalau error (error handling)
      Get.snackbar('Error', e.message.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.black.withOpacity(0.5),
          colorText: Colors.white);


    } finally {
      //loading kalau dipencet 
      isLoading.value = false;
    }
  }

  //signup dengan firebase
  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      //mulai loading
      isLoading.value = true;

      //fungsi
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email, password: password);
      
      //pindah
      Get.offAll(const HomePage());
    } on FirebaseAuthException catch (e) {

      //snackbar gagal
      Get.snackbar('Error', e.message.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.black.withOpacity(0.5),
          colorText: Colors.white);
    } finally {
      //bberenti loading
      isLoading.value = false;
    }
  }

  //logout
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
