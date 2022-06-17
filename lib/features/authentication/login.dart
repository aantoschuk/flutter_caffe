import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';

import 'package:caffe/features/authentication/login_form.dart';

import 'package:caffe/theme/icons.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Center(child: Text('Log in')),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 60, bottom: 50),
            child: Center(child: SvgPicture.asset(CustomIcons.appBrand)),
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 17),
              child: LoginForm(),
            ),
          )
        ],
      )),
    );
  }
}
