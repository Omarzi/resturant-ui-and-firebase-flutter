import 'package:flutter/material.dart';

class MyTextFieldPass extends StatefulWidget {
  final IconData iconData;
  final String text;
  final TextEditingController controller;
  final Function(dynamic value) function;
  final String validator;

  const MyTextFieldPass({
    Key? key,
    required this.controller,
    required this.iconData,
    required this.text, 
    required this.function, required this.validator,
  }) : super(key: key);

  @override
  State<MyTextFieldPass> createState() => _MyTextFieldPassState();
}

class _MyTextFieldPassState extends State<MyTextFieldPass> {
  @override
  Widget build(BuildContext context) {
    final textFieldFocusNode = FocusNode();
    bool _obscured = true;

    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      controller: widget.controller,
      validator: (value) {
        if (value!.isEmpty) {
          return widget.validator;
        } else {
          return null;
        }
      },
      obscureText: _obscured,
      onChanged: widget.function,
      decoration: InputDecoration(
        hintText: widget.text,
        prefixIcon: Icon(
          widget.iconData,
          size: 22,
        ),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _obscured = !_obscured;
            });
          },
          icon: _obscured
              ? const Icon(
                  Icons.visibility_off,
                )
              : const Icon(
                  Icons.visibility,
                ),
        ),
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
