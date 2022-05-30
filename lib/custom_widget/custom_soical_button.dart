import 'package:ecommerce_app/custom_widget/custom_text.dart';
import 'package:flutter/material.dart';

class CustomSoicalButton extends StatelessWidget {
  final String text;
  final Widget? icon;
  final VoidCallback? press;
  const CustomSoicalButton({Key? key, this.text = '', this.icon, this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        padding:
            const EdgeInsetsDirectional.only(top: 15, bottom: 15, start: 15),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 20,
              height: 20,
              child: icon,
            ),
            CustomText(text: text, fontSize: 15),
            const SizedBox()
          ],
        ),
      ),
    );
  }
}
