import 'package:ecommerce_app/custom_widget/custom_text.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String lable;
  final String hint;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;
  const CustomTextField(
      {Key? key, this.lable = '', this.hint = '', this.onSaved, this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(text: lable, color: Colors.grey, fontSize: 14),
        TextFormField(
          onSaved: onSaved,
          validator: validator,
          decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(fontSize: 14, color: Colors.grey)),
        )
      ],
    );
  }
}
