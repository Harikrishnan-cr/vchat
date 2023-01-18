import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vchat/controller/register_screen_controller/register_controller.dart';
import 'package:vchat/view/login_screen/login_screen.dart';
import 'package:vchat/view/register_screen/register_screen.dart';

class RegisterServices {
  final fireBaseAuth = FirebaseAuth.instance;

  final registerController = Get.put(RegisterScreenController());

  Future registerUser(
      {required String userEmail,
      required String userPassword,
      required BuildContext context}) async {
    try {
      await fireBaseAuth
          .createUserWithEmailAndPassword(
              email: userEmail, password: userPassword)
          .whenComplete(
              () => Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  )));
      RegisterScreen.clearAllFeilds();
    } catch (e) {
      registerController.isUserAccountAlreadyExist();
      log(e.toString());
    }
  }
}
