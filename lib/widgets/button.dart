import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Function()? onTap;
  final Color backgroundColor;
  final Color foregroundColor;
  final bool isDisabled;
  final String text;
  const Button({
    Key? key,
    required this.onTap,
    required this.text,
    this.isDisabled = false,
    this.backgroundColor = Colors.black,
    this.foregroundColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(4),
            ),
          ),
        ),
        backgroundColor: !isDisabled
            ? MaterialStateProperty.all(backgroundColor)
            : MaterialStateProperty.all(Colors.amber),
        foregroundColor: MaterialStateProperty.all(foregroundColor),
      ),
      child: Text(text),
    );
  }
}
