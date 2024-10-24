import 'package:countus/Screen/login/controllers/login_controller.dart';
import 'package:countus/Screen/login/views/login.dart';
import 'package:countus/Screen/signup/controllers/signup_controllers.dart';
import 'package:countus/firebase_options.dart';
import 'package:countus/repository/auth_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then(
    (value) => Get.put(AuthRepository()),
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SignupControllers(), fenix: true);
    Get.lazyPut(() => LoginController(), fenix: true);
    return const GetMaterialApp(home: LoginScreen());
  }
}
