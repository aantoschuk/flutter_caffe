import 'dart:developer';
import 'dart:io';

import 'package:caffe/cubit/auth/auth_cubit.dart';
import 'package:caffe/models/user.dart';
import 'package:caffe/utils/service/repository.dart';
import 'package:caffe/utils/service/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jwt_decode/jwt_decode.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  User? user;
  final ImagePicker _picker = ImagePicker();
  File? avatar;

  void initializeUser() async {
    final ApiRepository apiRepository = ApiRepository();
    String? token;
    await SecureStorage.getToken().then((value) {
      token = value;
    });
    final data = Jwt.parseJwt(token ?? '');
    try {
      await apiRepository.fetchUser(data['email'], token ?? '').then((value) {
        setState(() {
          user = value;
        });
      });
    } catch (e) {
      log(e.toString());
      if (!mounted) return;
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  void initState() {
    super.initState();
    initializeUser();
  }

  Future getImage() async {
    final image = await _picker.pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final temp = File(image.path);
    setState(() {
      avatar = temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (user != null) {
      return Align(
        alignment: Alignment.topCenter,
        child: Container(
          width: double.infinity,
          height: 112,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.7),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: const Offset(1, 2)),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: GestureDetector(
                  onTap: () => getImage(),
                  child: SizedBox(
                    child: avatar != null
                        ? CircleAvatar(
                            radius: 40.0,
                            backgroundColor: Colors.transparent,
                            backgroundImage: FileImage(avatar!),
                          )
                        : const Icon(
                            Icons.add_a_photo,
                          ),
                  ),
                ),
              ),
              const Text('info'),
              const Padding(
                padding: EdgeInsets.only(right: 26),
                child: Text('role'),
              ),
            ],
          ),
        ),
      );
    } else {
      const Text(' not hello');
    }
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
