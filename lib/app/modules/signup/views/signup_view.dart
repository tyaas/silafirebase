import 'package:basic_firebase/app/controllers/auth_controller.dart';
import 'package:basic_firebase/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  final cAuth = Get.find<AuthController>();
  final sConteroller = Get.put(SignupController());
  SignupView({Key? key}) : super(key: key);
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
                height: 220,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 95,
                      child: Image.asset(
                        'assets/images/logo.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Text(
                            "UNIVERSITAS TEKNOKRAT",
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                                textAlign: TextAlign.center,
                          ),
                          Text(
                            "INDONESIA",
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                                textAlign: TextAlign.center,
                          ),
                        ],
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
                      "Silakan Registrasi Terlebih Dahulu",
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
                        controller: sConteroller.cEmail,
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
                        controller: sConteroller.cPass,
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
                          cAuth.signup(
                            sConteroller.cEmail.text,
                            sConteroller.cPass.text,
                          );
                        },
                        child: Text("Daftar"),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: 180,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.offAllNamed(Routes.LOGIN);
                          print("Login");
                        },
                        child: Text("Login"),
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
