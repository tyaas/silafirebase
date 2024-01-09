import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {

  final cEmail = TextEditingController();
  final cPass = TextEditingController();
  bool showOrHidePass = true;
  bool rememberPass = true;

  get isPasswordHidden => null;
  @override
  void onClose() {
    cEmail.clear();
    cPass.clear();
    super.onClose();
  }

  void togglePasswordVisibility() {}
}
