import 'package:ecommerce_app/custom_widget/custom_button.dart';
import 'package:ecommerce_app/custom_widget/custom_text.dart';
import 'package:ecommerce_app/custom_widget/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);

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
        child: Container(
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
            child: Column(children: [
              const CustomText(text: 'Sign Up', fontSize: 30),
              const SizedBox(height: 25),
              CustomTextField(
                keyboardType: TextInputType.name,
                lable: 'Name',
                hint: 'Enter your name',
                validator: (value) {
                  return null;
                },
                onSaved: (value) {},
              ),
              const SizedBox(height: 25),
              CustomTextField(
                lable: 'Email',
                hint: 'Enter your email',
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  return null;
                },
                onSaved: (value) {},
              ),
              const SizedBox(height: 25),
              CustomTextField(
                lable: 'Password',
                keyboardType: TextInputType.visiblePassword,
                hint: 'Enter your Password',
                obscureText: true,
                validator: (value) {
                  return null;
                },
                onSaved: (value) {},
              ),
              const SizedBox(height: 20),
              const CustomButton(text: 'Sign Up'),
            ])),
      ),
    );
  }
}
