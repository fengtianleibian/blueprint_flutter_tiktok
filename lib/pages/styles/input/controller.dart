import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InputController extends GetxController {
  InputController();

  // 表单key
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // 用户名
  TextEditingController usernameController = TextEditingController();

  // 密码
  TextEditingController passwordController = TextEditingController();

  _initData() {
    update(["input"]);
  }

  void onTap() {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
