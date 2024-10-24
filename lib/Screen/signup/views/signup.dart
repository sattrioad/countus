// ignore_for_file: prefer_const_constructors

import 'package:countus/Screen/login/views/login.dart';
import 'package:countus/Screen/signup/controllers/signup_controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';

class SingUp extends StatelessWidget {
  const SingUp({super.key});

  @override
  Widget build(BuildContext context) {
    final SignupControllers signupControllers = Get.find();
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            iconTheme: const IconThemeData(color: Color(0XFF011F6B)),
          ),
          extendBodyBehindAppBar: true,
          backgroundColor: const Color(0XFF011F6B),
          body: Stack(
            children: [
              SizedBox(
                width: double.infinity,
                child: Image(
                  image: AssetImage('assets/images/login_background.png'),
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: SizedBox(
                  height: 700,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(80)),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment:
                            CrossAxisAlignment.center, // Menambahkan ini
                        children: [
                          Text(
                            'Sign Up',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Start your journey with us \n by registering your account',
                            textAlign: TextAlign
                                .center, // Menambahkan ini untuk meratakan teks
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[700],
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          // SizedBox(
                          //   width: 320,
                          //   height: 50,
                          //   child: TextFormField(
                          //     decoration: InputDecoration(
                          //       labelText: 'Username',
                          //       labelStyle:
                          //           const TextStyle(color: Color(0XFF8A8888)),
                          //       filled: true,
                          //       fillColor: Colors.white.withOpacity(0.8),
                          //       border: OutlineInputBorder(
                          //         borderRadius: BorderRadius.circular(10),
                          //       ),
                          //     ),
                          //     style: const TextStyle(color: Color(0XFF011F6B)),
                          //   ),
                          // ),
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: 320,
                            height: 50,
                            child: TextFormField(
                              controller: signupControllers.emailController,
                              decoration: InputDecoration(
                                labelText: 'email',
                                labelStyle:
                                    const TextStyle(color: Color(0XFF8A8888)),
                                filled: true,
                                fillColor: Colors.white.withOpacity(0.8),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              style: const TextStyle(color: Color(0XFF011F6B)),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          // SizedBox(
                          //   width: 320,
                          //   height: 50,
                          //   child: TextFormField(
                          //     decoration: InputDecoration(
                          //       labelText: 'Phone Number',
                          //       labelStyle:
                          //           const TextStyle(color: Color(0XFF8A8888)),
                          //       filled: true,
                          //       fillColor: Colors.white.withOpacity(0.8),
                          //       border: OutlineInputBorder(
                          //         borderRadius: BorderRadius.circular(10),
                          //       ),
                          //     ),
                          //     style: const TextStyle(color: Color(0XFF011F6B)),
                          //   ),
                          // ),
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: 320,
                            height: 50,
                            child: TextFormField(
                              controller: signupControllers.passwordController,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                labelStyle:
                                    const TextStyle(color: Color(0XFF8A8888)),
                                filled: true,
                                fillColor: Colors.white.withOpacity(0.8),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              style: const TextStyle(color: Color(0XFF011F6B)),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          // SizedBox(
                          //   width: 320,
                          //   height: 50,
                          //   child: TextFormField(
                          //     decoration: InputDecoration(
                          //       labelText: 'Confirm Password',
                          //       labelStyle:
                          //           const TextStyle(color: Color(0XFF8A8888)),
                          //       filled: true,
                          //       fillColor: Colors.white.withOpacity(0.8),
                          //       border: OutlineInputBorder(
                          //         borderRadius: BorderRadius.circular(10),
                          //       ),
                          //     ),
                          //     style: const TextStyle(color: Color(0XFF011F6B)),
                          //   ),
                          // ),
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: 320,
                            child: ElevatedButton(
                              onPressed: () {
                                signupControllers
                                    .createUserWithEmailAndPassword(
                                        signupControllers.emailController.text
                                            .trim(),
                                        signupControllers
                                            .passwordController.text
                                            .trim());
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0XFF011F6B),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 100),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: const Text(
                                'Sign Up',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          SizedBox(
                            height: 40,
                            child: Column(
                              children: [
                                Text(
                                  "Already have an account?",
                                  style: TextStyle(
                                    color: Color(0XFF011F6B),
                                    fontSize: 14,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.to(LoginScreen());
                                  },
                                  child: const Text(
                                    'Log in',
                                    style: TextStyle(
                                      color: Color(0XFF005B96),
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Obx(() {
          if (signupControllers.authRepository.isLoading.value) {
            return Container(
                color: Colors.black.withOpacity(0.5),
                child: const Center(
                  child: CircularProgressIndicator(),
                ));
          } else {
            return const SizedBox.shrink();
          }
        })
      ],
    );
  }
}
