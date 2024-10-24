import 'package:countus/Screen/login/views/login.dart';
import 'package:countus/firebase_options.dart';
import 'package:countus/repository/auth_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then(
    (value) => Get.put(AuthRepository()),
  );
  WidgetsFlutterBinding();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(home: LoginScreen());
  }
}
