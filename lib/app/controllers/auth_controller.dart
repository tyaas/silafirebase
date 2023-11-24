import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:basic_firebase/app/routes/app_pages.dart';
import 'package:google_sign_in/google_sign_in.dart';


class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  Stream<User?> get streamAuthStatus => auth.authStateChanges();

  get user => null;

  void signup(String emailAddress, String password) async {
    try {
      UserCredential myUser = await auth.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      await myUser.user!.sendEmailVerification();
      Get.defaultDialog(
          title: "Verifikasi email",
          middleText:
              "Kami telah mengirimkan verfikasi ke email $emailAddress.",
          onConfirm: () {
            Get.back(); //close dialog
            Get.back(); //login
          },
          textConfirm: "OK");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  void login(String emailAddress, String password) async {
    try {
      UserCredential myUser = await auth.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      if (myUser.user!.emailVerified) {
        //untuk routing
        Get.offAllNamed(Routes.HOME);
      } else {
        Get.defaultDialog(
          title: "Verifikasi email",
          middleText: "Harap verifikasi email terlebih dahulu",
        );
      }
    } on FirebaseAuthException catch (e) {
      print(e.code);
      if (e.code == 'invalid-email') {
      print(emailAddress);
        Get.dialog(
          AlertDialog(
            title: const Text(
              "Invalid Email",
            ),
            content: const Text(
              "Make sure you entered the correct email.",
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text("Ok"),
              ),
            ],
          ),
        );
      } else if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
        Get.defaultDialog(
            title: "Terjadi kesalahan",
            middleText: "Wrong password provided for that user.");

        print('Wrong password provided for that user.');
      }
    }
  }

  void resetPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      Get.defaultDialog(
        title: "Passrowd Reset",
        middleText: "Link to reset your password has sent to $email",
      );
      Get.toNamed(Routes.LOGIN);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        Get.defaultDialog(
          title: "Error",
          middleText: "No user found for that email.",
        );
      }
    }
  }

  void loginGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    // make dialog succes login
    Get.offAllNamed(Routes.HOME);
          
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }
}
