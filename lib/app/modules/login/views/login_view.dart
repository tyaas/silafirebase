import 'package:basic_firebase/app/controllers/auth_controller.dart';
import 'package:basic_firebase/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final cAuth = Get.find<AuthController>();
  final loginController = Get.put(LoginController());
  LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        
        body: Column(
          children: [
            TextField(
              keyboardType: TextInputType.emailAddress,
                controller: loginController.cEmail,
                decoration: const InputDecoration(
                  labelText: 'Email',
                )),
            TextField(
                controller: loginController.cPass,
                decoration: const InputDecoration(
                  labelText: 'Password',
                )),
            ElevatedButton(
              onPressed: () {
                cAuth.login(loginController.cEmail.text,loginController.cPass.text);
              },
              child: Text("Login"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.offAllNamed(Routes.SIGNUP);
                print("Register");
              },
              child: Text("Register"),
            ),
          ],
        ),
      ),
    );
  }
}
