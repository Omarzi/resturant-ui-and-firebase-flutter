import 'package:flutter/material.dart';

import 'package:food_app_with_fb/constant.dart';

class MyTextField extends StatelessWidget {
  TextInputType textInputType = TextInputType.emailAddress;

  final String hintText;
  // final String text;
  final bool obscureText;
  final IconData iconData;
  final TextEditingController controller;
  final Function(dynamic value) function;
  // final value;
  final String validator;

    MyTextField({
    Key? key,
    required this.textInputType,
    required this.hintText,
    required this.obscureText,
    required this.iconData,
    required this.controller,
    required this.function,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      validator: (value) {
        if (value!.isEmpty) {
          return validator;
        } else {
          return null;
        }
      },
      controller: controller,
      obscureText: obscureText,
      onChanged: function,
      cursorColor: Color(0xFFFF961F).withOpacity(0.7),
      style: const TextStyle(color: Colors.black45),
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(
          iconData,
          size: 22,
        ),
        iconColor: Colors.grey[800],
        hintStyle: const TextStyle(color: Colors.black45),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blue[800]!),
      ),
    ),
    );
  }
}
