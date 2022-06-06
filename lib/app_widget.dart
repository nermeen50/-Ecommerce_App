import 'package:ecommerce_app/view/auth/login_view.dart';
import 'package:ecommerce_app/view/home/home_view.dart';
import 'package:ecommerce_app/view_model/auth_view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppWidget extends GetWidget<AuthViewModel> {
  final userController = Get.find<AuthViewModel>();
  AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => userController.user == null ? LoginView() : HomeView());
  }
}
