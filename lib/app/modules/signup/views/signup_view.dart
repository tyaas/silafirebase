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
        appBar: AppBar(
          title: const Text('Login'),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Get.offAllNamed(Routes.LOGIN);
            },
            icon: Icon(Icons.arrow_back),
          )          
        ),
        body: Column(
          children: [
             Text("Signup"),
            TextField(
              keyboardType: TextInputType.emailAddress,
                controller: sConteroller.cEmail,
                decoration: const InputDecoration(
                  labelText: 'Email',
                )),
            TextField(
                controller: sConteroller.cPass,
                decoration: const InputDecoration(
                  labelText: 'Password',
                )),
            ElevatedButton(
              onPressed: () {
                cAuth.signup(sConteroller.cEmail.text, sConteroller.cPass.text);
              },
              child: Text("Signup"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.offAllNamed(Routes.LOGIN);
                print("Login");
              },
              child: Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
