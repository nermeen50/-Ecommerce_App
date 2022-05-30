import 'package:ecommerce_app/custom_widget/custom_button.dart';
import 'package:ecommerce_app/custom_widget/custom_text.dart';
import 'package:ecommerce_app/view_model/auth_view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthViewModel viewModel = Get.put(AuthViewModel());
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          // Obx(() => CustomText(text: '${viewModel.counter}')),
          // CustomButton(
          //     text: "lfff",
          //     press: () {
          //       viewModel.increment();
          //       print('object');
          //     })
        ],
      ),
    );
  }
}
