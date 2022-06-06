import 'package:ecommerce_app/core/constant/app_color.dart';
import 'package:ecommerce_app/core/validation.dart';
import 'package:ecommerce_app/custom_widget/custom_button.dart';
import 'package:ecommerce_app/custom_widget/custom_soical_button.dart';
import 'package:ecommerce_app/custom_widget/custom_text.dart';
import 'package:ecommerce_app/custom_widget/custom_textfield.dart';
import 'package:ecommerce_app/view/auth/signUp_view.dart';
import 'package:ecommerce_app/view_model/auth/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends GetWidget<AuthViewModel> with Validations {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 229, 229),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Column(
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const CustomText(text: 'Welcome ,', fontSize: 30),
                          InkWell(
                            onTap: () => Get.to(() => SignUpView()),
                            child: CustomText(
                                text: 'Sign Up',
                                fontSize: 18,
                                color: AppColors.primaryColor),
                          ),
                        ]),
                    const SizedBox(height: 10),
                    const CustomText(
                        text: 'Sign in to continue',
                        fontSize: 14,
                        color: Colors.grey),
                    const SizedBox(height: 25),
                    CustomTextField(
                      onChanged: (value) => validateEmail(value),
                      controller: controller.email.value,
                      keyboardType: TextInputType.emailAddress,
                      lable: 'Email',
                      hint: 'Enter your email',
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
                          controller: controller.password.value,
                          obscureText:
                              controller.isObscure.value ? false : true,
                          keyboardType: TextInputType.visiblePassword,
                          lable: 'Password',
                          hint: 'Enter your Password',
                          validator: (value) => validatePassword(value),
                        )),
                    const SizedBox(height: 20),
                    const CustomText(
                        text: 'Forget password?',
                        alignment: AlignmentDirectional.centerEnd,
                        color: Colors.grey),
                    const SizedBox(height: 20),
                    Obx(() => controller.isLoading.value
                        ? CircularProgressIndicator(
                            color: AppColors.primaryColor)
                        : CustomButton(
                            text: 'Sign in',
                            press: () {
                              if (_formKey.currentState!.validate()) {
                                controller.signInWithEmailAndPassword();
                              }
                            })),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              const CustomText(
                  text: '-OR-',
                  fontSize: 18,
                  alignment: AlignmentDirectional.center),
              const SizedBox(height: 10),
              CustomSoicalButton(
                  press: () {
                    controller.signInWithFacebook();
                  },
                  icon: const Icon(Icons.facebook, color: Colors.blue),
                  text: 'Sign in with facebook'),
              const SizedBox(height: 10),
              CustomSoicalButton(
                  press: () {
                    controller.signInWithGoogle();
                  },
                  icon: Image.asset('assets/images/google_icon.png'),
                  text: 'Sign in with google'),
            ],
          ),
        ),
      ),
    );
  }
}
