import 'package:ecommerce_app/core/constant/app_color.dart';
import 'package:ecommerce_app/custom_widget/custom_text.dart';
import 'package:ecommerce_app/custom_widget/custom_textfield.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              const CustomText(text: 'Welcome ,', fontSize: 30),
              CustomText(
                  text: 'Sign Up', fontSize: 18, color: AppColors.primaryColor),
            ]),
            const SizedBox(height: 10),
            const CustomText(
                text: 'Sign in to continue', fontSize: 14, color: Colors.grey),
            const SizedBox(height: 25),
            CustomTextField(
              lable: 'Email',
              hint: 'Enter your email',
              validator: (value) {},
              onSaved: (value) {},
            ),
            const SizedBox(height: 25),
            CustomTextField(
              lable: 'Password',
              hint: 'Enter your Password',
              validator: (value) {},
              onSaved: (value) {},
            ),
            const SizedBox(height: 20),
            const CustomText(
                text: 'Forget password?',
                alignment: AlignmentDirectional.centerEnd,
                color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
