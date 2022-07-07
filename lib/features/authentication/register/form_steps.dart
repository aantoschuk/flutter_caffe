import 'package:flutter/material.dart';

import 'package:caffe/widgets/form/custom_text_field.dart';
import 'package:caffe/features/authentication/body_page.dart';
import 'package:caffe/features/authentication/widgets/codempire_brand.dart';
import 'package:caffe/features/authentication/widgets/welcome_message.dart';

import 'package:caffe/utils/service/routes.dart';
import 'package:caffe/utils/helpers/events.dart';

class FormSteps extends StatelessWidget {
  final int index;
  final CustomTextField emailField;
  final CustomTextField passwordField;
  final CustomTextField nameField;
  final CustomTextField phoneField;
  final Function() createUser;
  final Function() updateUser;

  const FormSteps({
    super.key,
    required this.index,
    required this.emailField,
    required this.passwordField,
    required this.createUser,
    required this.nameField,
    required this.phoneField,
    required this.updateUser,
  });

  Widget _getContent(BuildContext context, int index) {
    final List<Widget> steps = <Widget>[
      BodyPage(
        buttonText: 'CREATE',
        logo: codempireBrand(),
        firstField: emailField,
        secondField: passwordField,
        backButton: InkWell(
          onTap: () {
            Navigator.pushReplacementNamed(context, Routes.login);
          },
          child: const Text('Log in'),
        ),
        firstButtonClick: createUser,
        secondButtonClick: () => navigateToMain(context),
      ),
      BodyPage(
        buttonText: 'NEXT',
        logo: welcomeMessage(),
        firstField: nameField,
        secondField: phoneField,
        firstButtonClick: updateUser,
        secondButtonClick: () => navigateToMain(context),
      ),
    ];
    return steps[index];
  }

  @override
  Widget build(BuildContext context) {
    return _getContent(context, index);
  }
}
