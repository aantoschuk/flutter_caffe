import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:caffe/widgets/input.dart';
import 'package:caffe/widgets/button.dart';
import 'package:caffe/widgets/secure_input.dart';
import 'package:caffe/cubit/auth/auth_cubit.dart';

import 'package:caffe/utils/service/routes.dart';
import 'package:caffe/utils/helpers/helpers.dart';
import 'package:caffe/utils/service/repository.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  LoginFormState createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  bool _isError = false;

  TextEditingController emailEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();

  void onSkiptap() => Navigator.pushReplacementNamed(context, Routes.initial);
  void submit() async {
    if (_formKey.currentState!.validate() && _isError == false) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Processing Data')));

      final ApiRepository apiRepository = ApiRepository();

      try {
        final payload = {
          'email': emailEditingController.text,
          'password': passwordEditingController.text
        };
        final response = await apiRepository.login(payload);
        if (response.accessToken.isNotEmpty) {
          if (!mounted) return;
          BlocProvider.of<AuthCubit>(context).setToken(response.accessToken);
          onSkiptap();
        }
      } catch (e) {
        log(e.toString());
      }
    }
  }

  void setError(bool isError) {
    setState(() {
      _isError = isError;
    });
  }

  String? validation(value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    if (emailValidation(value) == false) {
      return 'Wrong email';
    }
    setState(() {
      _isError = false;
    });
    return null;
  }

  String? passwordValidation(String value) {
    if (value.isEmpty || value.isEmpty) {
      setState(() {
        _isError = true;
      });
      return 'This field is required';
    }
    if (value.length < 4) {
      setState(() {
        _isError = true;
      });
      return 'Password should contain more then 4 characters';
    }
    setState(() {
      _isError = false;
    });
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            Input(
              controller: emailEditingController,
              hint: 'Email',
              validation: validation,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: SecureInput(
                  hint: 'Password',
                  setError: setError,
                  validation: passwordValidation,
                  controller: passwordEditingController),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Forgot Password?'),
                GestureDetector(
                  onTap: null,
                  child: const Text('Sign up'),
                )
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 48,
                    width: double.infinity,
                    child: Button(
                      onTap: submit,
                      text: 'LOG IN',
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: SizedBox(
                      height: 48,
                      width: double.infinity,
                      child: Button(
                        onTap: onSkiptap,
                        text: 'SKIP',
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

// class LoginFormState extends State<LoginForm> {
//   final _formKey = GlobalKey<FormState>();
//   final Widget eyeIcon = SvgPicture.asset(CustomIcons.eye);

//   bool obscure = true;
//   void onSkiptap() => Navigator.pushReplacementNamed(context, Routes.initial);

//   void submit() {
//     if (_formKey.currentState!.validate()) {
//       ScaffoldMessenger.of(context)
//           .showSnackBar(const SnackBar(content: Text('Processing Data')));
//     }
//   }

//   void _toogle() {
//     setState(() {
//       obscure = !obscure;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               // const Input(hint: 'Email'),
//               // Row(
//               //   children: [
//               //     const Input(hint: 'Password'),
//               //     GestureDetector(
//               //       onTap: _toogle,
//               //       child: SvgPicture.asset(CustomIcons.eye),
//               //     ),
//               //   ],
//               // ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Text('Forgot Password?'),
//                   GestureDetector(
//                     onTap: null,
//                     child: const Text('Sign up'),
//                   )
//                 ],
//               ),
//               Expanded(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     SizedBox(
//                       width: double.infinity,
//                       child: Button(onTap: submit, text: 'LOG IN'),
//                     ),
//                     SizedBox(
//                       width: double.infinity,
//                       child: Button(
//                         onTap: onSkiptap,
//                         text: 'SKIP',
//                         foregroundColor: Colors.black,
//                         backgroundColor: Colors.white,
//                       ),
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           )),
//     );
//   }
// }
