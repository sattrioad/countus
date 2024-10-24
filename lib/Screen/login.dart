import 'package:countus/Screen/homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Inisialisasi LoginController dengan Get.put()
    final loginController = Get.put(LoginController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Color(0XFF011F6B)),
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0XFF011F6B),
      body: SizedBox(
        width: double.infinity,
        child: Stack(
          children: [
            const SizedBox(
              width: double.infinity,
              child: Image(
                image: AssetImage('assets/images/login_background.png'),
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 55,
              left: 0,
              right: 0,
              child: Image.asset(
                'assets/images/Group.png',
                height: 680,
                width: 680,
                fit: BoxFit.cover,
              ),
            ),
            const Positioned(
              top: 250,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  "Login",
                  style: TextStyle(
                    color: Color(0XFF011F6B),
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const Positioned(
              top: 290,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  "Please login to your account \nto use our features",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0XFF011F6B),
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 350,
              left: 30,
              right: 30,
              child: Form(
                key:
                    loginController.formKey, // Menggunakan GlobalKey untuk Form
                child: Column(
                  children: [
                    // TextFormField untuk email dengan validasi karakter '@'
                    TextFormField(
                      controller: loginController.emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: const TextStyle(color: Color(0XFF8A8888)),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.8),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        errorStyle: const TextStyle(
                          color: Colors.red,
                        ),
                      ),
                      style: const TextStyle(color: Color(0XFF011F6B)),
                      validator: (value) {
                        if (value == null || !value.contains('@')) {
                          return 'Email harus memuat @';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),

                    // TextFormField untuk password dengan toggle obscure
                    Obx(
                      () => TextFormField(
                        obscureText: loginController.isPasswordHidden.value,
                        controller: loginController.passwordController,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: const TextStyle(color: Color(0XFF8A8888)),
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.8),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              loginController.isPasswordHidden.value
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: const Color(0XFF011F6B),
                            ),
                            onPressed: loginController.togglePasswordVisibility,
                          ),
                        ),
                        style: const TextStyle(color: Color(0XFF011F6B)),
                      ),
                    ),

                    const SizedBox(height: 4),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: () {
                          // Fungsi untuk "Forgot Password"
                        },
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Color(0XFF011F6B),
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    SizedBox(
                      width: 700,
                      child: ElevatedButton(
                        onPressed: () {
                          // Validasi form sebelum login
                          if (loginController.formKey.currentState!
                              .validate()) {
                            loginController.signIn(
                                loginController.emailController.text,
                                loginController.passwordController.text);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomePage()));
                          }
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
                          'Login',
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
                          const Text(
                            "Don't have an account?",
                            style: TextStyle(
                              color: Color(0XFF011F6B),
                              fontSize: 14,
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: const Text(
                              'Signup',
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
          ],
        ),
      ),
    );
  }
}

class LoginController extends GetxController {
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
}
