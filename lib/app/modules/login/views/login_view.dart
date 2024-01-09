import 'package:basic_firebase/app/controllers/auth_controller.dart';
import 'package:basic_firebase/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';
import 'package:flutter/material.dart';

class LoginView extends GetView<LoginController> {
  final cAuth = Get.find<AuthController>();
  final loginController = Get.put(LoginController());
  LoginView({Key? key}) : super(key: key);
  @override
    Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Color.fromARGB(255, 1, 9, 71),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //LOGO
              Container(
                // margin: EdgeInsets.all(10),
                color: Color.fromARGB(255, 1, 9, 71),
                height: 120,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 95,
                      height: 95,
                      child: Image.asset(
                        'assets/images/logo.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    // Spacer antara gambar dan teks
                    Container(
                      height: 100,
                      padding: EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Text(
                            "UNIVERSITAS TEKNOKRAT",
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            "INDONESIA",
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 35,
                width: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment
                      .center, // Sesuaikan posisi teks di dalam container
                  children: [
                    Text(
                      "Disiplin, Bermutu, Kreatif, dan Inovatif",
                      style: TextStyle(
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        color: Colors.amber[600],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment
                      .center, // Sesuaikan posisi teks di dalam container
                  children: [
                    Text(
                      "Sistem Informasi Layanan Akademik",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment
                      .center, // Sesuaikan posisi teks di dalam container
                  children: [
                    Text(
                      "Silakan Login terlebih Dahulu",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),

              
              // Add some space between image and text fields
              // Input Form
              Container(
                padding: EdgeInsets.all(40), // Adjust padding as needed
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        controller: loginController.cEmail,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          prefixIcon: Icon(Icons.person),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          border: InputBorder
                              .none, // Menghilangkan garis bawah teks
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      height: 45.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: TextField(
                        controller: loginController.cPass,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          prefixIcon: Icon(Icons.lock),
                          border: InputBorder
                              .none, // Menghilangkan garis bawah teks
                        ),
                        obscureText: true,
                      ),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Container(
                      width: 180,
                      child: ElevatedButton(
                        onPressed: () {
                          cAuth.login(
                            loginController.cEmail.text,
                            loginController.cPass.text,
                          );
                        },
                        child: Text("Login"),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: 180,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.offAllNamed(Routes.SIGNUP);
                          print("Register");
                        },
                        child: Text("Register"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
