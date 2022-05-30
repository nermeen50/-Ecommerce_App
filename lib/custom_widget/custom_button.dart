import 'package:ecommerce_app/core/constant/app_color.dart';
import 'package:ecommerce_app/custom_widget/custom_text.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function()? press;
  const CustomButton({Key? key, required this.text, this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: press,
      style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(
              const EdgeInsets.symmetric(vertical: 15)),
          backgroundColor:
              MaterialStateProperty.all<Color>(AppColors.primaryColor)),
      child: CustomText(
          text: text,
          color: Colors.white,
          alignment: AlignmentDirectional.center),
    );
  }
}
