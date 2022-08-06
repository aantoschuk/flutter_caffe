import 'package:caffe/cubit/auth/auth_cubit.dart';
import 'package:caffe/utils/service/secure_storage.dart';
import 'package:flutter/material.dart';

import 'package:caffe/widgets/input.dart';
import 'package:caffe/widgets/button.dart';
import 'package:caffe/widgets/secure_input.dart';

import 'package:caffe/utils/service/routes.dart';
import 'package:caffe/utils/helpers/helpers.dart';
import 'package:caffe/utils/service/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  void onRegisterTap() =>
      Navigator.pushReplacementNamed(context, Routes.register);

  void submit() async {
    if (_formKey.currentState!.validate() && _isError == false) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Processing Data')));

      final ApiRepository apiRepository = ApiRepository();

      try {
        final payload = {
          'email': emailEditingController.text.trim(),
          'password': passwordEditingController.text.trim()
        };
        final response = await apiRepository.login(payload);
        if (response.accessToken.isNotEmpty) {
          if (!mounted) return;
          SecureStorage.saveToken(response.accessToken);
          BlocProvider.of<AuthCubit>(context).setToken(response.accessToken);
          onSkiptap();
        }
      } catch (e) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.toString())));
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
                  onTap: onRegisterTap,
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
