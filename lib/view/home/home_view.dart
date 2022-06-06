import 'package:ecommerce_app/custom_widget/custom_button.dart';
import 'package:ecommerce_app/view/auth/login_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButton(
              text: "lfff",
              press: () {
                _auth.signOut().then((value) => Get.offAll(() => LoginView()));
              })
        ],
      ),
    );
  }
}
