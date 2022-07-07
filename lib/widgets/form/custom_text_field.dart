import 'package:flutter/material.dart';

import '../../theme/fonts.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final Widget? suffixIcon;
  final bool obscureText;
  final Function(String)? onChange;
  final Function validation;

  final TextEditingController? controller;

  const CustomTextField({
    Key? key,
    this.onChange,
    this.suffixIcon,
    this.controller,
    this.obscureText = false,
    required this.label,
    required this.validation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) => validation(value),
      obscureText: obscureText,
      autofocus: false,
      onChanged: onChange,
      controller: controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(10),
        labelText: label,
        errorStyle: const TextStyle(fontSize: FontSize.small, height: 0.5),
        suffix: const Padding(padding: EdgeInsets.only(right: 24.0)),
        suffixIcon: suffixIcon,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 206, 36, 24),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
        ),
        labelStyle: const TextStyle(
          color: Colors.black,
          fontSize: FontSize.small,
        ),
      ),
    );
  }
}
