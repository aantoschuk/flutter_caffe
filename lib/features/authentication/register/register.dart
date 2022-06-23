import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';

import 'package:caffe/widgets/button.dart';

import 'package:caffe/theme/icons.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  int currentIndex = 0;

  void increment() {
    setState(() {
      currentIndex++;
    });
  }

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
          Text('$currentIndex'),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: Button(
                onTap: increment,
                text: 'NEXT',
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
              ))
        ],
      )),
    );
  }
}
