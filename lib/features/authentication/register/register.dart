import 'package:caffe/cubit/auth/auth_cubit.dart';
import 'package:caffe/utils/service/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:caffe/widgets/form/custom_text_field.dart';
import 'package:caffe/features/authentication/register/form_steps.dart';

import 'package:caffe/utils/helpers/events.dart';
import 'package:caffe/utils/helpers/helpers.dart';

import 'package:caffe/utils/service/repository.dart';

import 'package:caffe/theme/icons.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  int currentIndex = 0;

  bool obscureText = true;

  final _formKey = GlobalKey<FormState>();

  TextEditingController emailEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
  TextEditingController nameEditingController = TextEditingController();
  TextEditingController phoneEditingControlller = TextEditingController();

  void createUser() async {
    if (_formKey.currentState!.validate()) {
      final ApiRepository apiRepository = ApiRepository();

      try {
        final payload = {
          'email': emailEditingController.text,
          'password': passwordEditingController.text
        };
        final response = await apiRepository.register(payload);

        if (response.accessToken.isEmpty) {
          throw Exception('No token');
        }
        if (!mounted) return;
        setState(() {
          ++currentIndex;
        });
        // STORE TOKEN HERE
        SecureStorage.saveToken(response.accessToken);
        BlocProvider.of<AuthCubit>(context).setToken(response.accessToken);
      } catch (e) {
        if (!mounted) return;
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.toString())));
      }
    }
  }

  void updateUser() async {
    if (_formKey.currentState!.validate()) {
      final ApiRepository apiRepository = ApiRepository();

      try {
        final payload = {
          'phone': phoneEditingControlller.text,
          'full_name': nameEditingController.text,
        };

        final authState =
            BlocProvider.of<AuthCubit>(context).state as AuthLoaded;

        apiRepository.update(
            emailEditingController.text, payload, authState.token);
        navigateToMain(context);
      } catch (e) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.toString())));
      }
    }
  }

  void changeVisibility() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  void increment() {
    setState(() {
      ++currentIndex;
    });
  }

  void decrement() {
    setState(() {
      --currentIndex;
    });
  }

  String? firstFieldValidation(value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    if (emailValidation(value) == false) {
      return 'Wrong email';
    }

    return null;
  }

  String? simpleValidation(value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Center(child: Text('Sign up')),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: Form(
            key: _formKey,
            child: FormSteps(
              index: currentIndex,
              createUser: createUser,
              updateUser: updateUser,
              emailField: CustomTextField(
                label: 'Email',
                validation: firstFieldValidation,
                controller: emailEditingController,
              ),
              nameField: CustomTextField(
                label: 'Name',
                validation: simpleValidation,
                controller: nameEditingController,
              ),
              phoneField: CustomTextField(
                label: 'Phone number',
                validation: simpleValidation,
                controller: phoneEditingControlller,
              ),
              passwordField: CustomTextField(
                label: 'Password',
                validation: simpleValidation,
                obscureText: obscureText,
                controller: passwordEditingController,
                suffixIcon: IconButton(
                  onPressed: changeVisibility,
                  icon: obscureText
                      ? SvgPicture.asset(CustomIcons.eyeOpen)
                      : SvgPicture.asset(CustomIcons.eyeClosed),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
