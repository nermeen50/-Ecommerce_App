import 'package:ecommerce_app/custom_widget/custom_text.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String lable;
  final String hint;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Function(String?)? onSaved;
  final FormFieldValidator? validator;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Function(String)? onChanged;
  final bool hasBorder;
  const CustomTextField({
    Key? key,
    this.lable = '',
    this.hint = '',
    this.onSaved,
    this.validator,
    this.keyboardType,
    this.obscureText = false,
    this.controller,
    this.suffixIcon,
    this.onChanged,
    this.prefixIcon,
    this.hasBorder = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(text: lable, color: Colors.grey, fontSize: 14),
        TextFormField(
          onChanged: onChanged,
          controller: controller,
          onSaved: onSaved,
          validator: validator,
          keyboardType: keyboardType,
          obscureText: obscureText,
          decoration: InputDecoration(
              fillColor: hasBorder
                  ? const Color.fromARGB(255, 241, 239, 239)
                  : Colors.transparent,
              filled: hasBorder ? true : false,
              border: hasBorder
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: BorderSide.none)
                  : const UnderlineInputBorder(),
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon,
              hintText: hint,
              hintStyle: const TextStyle(fontSize: 14, color: Colors.grey)),
        )
      ],
    );
  }
}
