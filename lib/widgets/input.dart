import 'package:flutter/material.dart';

import 'package:caffe/theme/fonts.dart';

class Input extends StatelessWidget {
  final String hint;
  Function? validation;
  final TextEditingController controller;
  Input(
      {Key? key, required this.hint, required this.controller, this.validation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          errorStyle: const TextStyle(fontSize: FontSize.small, height: 0.5),
          prefix: const Padding(padding: EdgeInsets.only(left: 10.0)),
          suffix: const Padding(padding: EdgeInsets.only(right: 24.0)),
          contentPadding: const EdgeInsets.only(bottom: 0.0, top: 20.0),
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
        ),
        validator: (value) => validation!(value),
      ),
    );
  }
}
