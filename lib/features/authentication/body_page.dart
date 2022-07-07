import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class BodyPage extends StatelessWidget {
  final Widget logo;
  final String buttonText;
  final Function()? firstButtonClick;
  final Function()? secondButtonClick;
  final CustomTextField firstField;
  final CustomTextField secondField;
  final Widget backButton;
  final TextEditingController firstFieldController = TextEditingController();

  BodyPage({
    super.key,
    required this.logo,
    required this.firstField,
    required this.secondField,
    required this.buttonText,
    this.firstButtonClick,
    this.secondButtonClick,
    this.backButton = const SizedBox(),
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 60, bottom: 50),
          child: Center(child: logo),
        ),
        SizedBox(
          height: 125,
          child: ListView(
            children: [
              firstField,
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: secondField,
              )
            ],
          ),
        ),
        backButton,
        const Spacer(),
        SizedBox(
          height: 48,
          width: double.infinity,
          child: Button(
            onTap: firstButtonClick,
            text: buttonText,
            foregroundColor: Colors.white,
            backgroundColor: Colors.black,
          ),
        ),
        SizedBox(
          height: 48,
          width: double.infinity,
          child: Button(
            onTap: secondButtonClick,
            text: 'SKIP',
            foregroundColor: Colors.black,
            backgroundColor: Colors.white,
          ),
        ),
      ],
    );
  }
}
