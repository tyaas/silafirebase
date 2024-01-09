import 'package:basic_firebase/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/setting_controller.dart';

class SettingView extends GetView<SettingController> {
  const SettingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: ListView(
          

          children: [
            IconButton(
              onPressed: () {
                Get.offAllNamed(Routes.HOME);
              },
              icon: Icon(
                Icons.home,

              ),
            ),
          ],
        ),
        
      ),
    );
  }
}
