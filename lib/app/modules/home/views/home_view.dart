import 'package:basic_firebase/app/controllers/auth_controller.dart';
import 'package:basic_firebase/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final cAuth = Get.find<AuthController>();
  HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
        
        body: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Get.offAllNamed(Routes.CRUD);
              },
              child: Text("CRUD"),
            ),
            ElevatedButton(
              onPressed: () {
                cAuth.logout();
              },
              child: Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
