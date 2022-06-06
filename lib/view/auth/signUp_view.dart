import 'package:ecommerce_app/core/constant/app_color.dart';
import 'package:ecommerce_app/core/validation.dart';
import 'package:ecommerce_app/custom_widget/custom_button.dart';
import 'package:ecommerce_app/custom_widget/custom_text.dart';
import 'package:ecommerce_app/custom_widget/custom_textfield.dart';
import 'package:ecommerce_app/view_model/auth/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpView extends GetWidget<AuthViewModel> with Validations {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 229, 229),
      appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black))),
      body: SingleChildScrollView(
        child: Form(
          key: _globalKey,
          child: Container(
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: Column(children: [
                const CustomText(text: 'Sign Up', fontSize: 30),
                const SizedBox(height: 25),
                CustomTextField(
                  controller: controller.name.value,
                  keyboardType: TextInputType.name,
                  lable: 'Name',
                  hint: 'Enter your name',
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Enter your name";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 25),
                CustomTextField(
                  controller: controller.registerEmail.value,
                  lable: 'Email',
                  hint: 'Enter your email',
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) => validateEmail(value),
                ),
                const SizedBox(height: 25),
                Obx(() => CustomTextField(
                      suffixIcon: IconButton(
                          onPressed: () {
                            controller.visablePassword();
                          },
                          icon: controller.isObscure.value
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off)),
                      controller: controller.registerPassword.value,
                      obscureText: controller.isObscure.value ? false : true,
                      keyboardType: TextInputType.visiblePassword,
                      lable: 'Password',
                      hint: 'Enter your Password',
                      validator: (value) => validatePassword(value),
                    )),
                const SizedBox(height: 20),
                Obx(() => controller.isLoading.value
                    ? CircularProgressIndicator(color: AppColors.primaryColor)
                    : CustomButton(
                        text: 'Sign Up',
                        press: () {
                          if (_globalKey.currentState!.validate()) {
                            controller.createAccountWithEmailAndPassword();
                          }
                        }))
              ])),
        ),
      ),
    );
  }
}
