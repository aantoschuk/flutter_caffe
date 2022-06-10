import 'package:flutter/material.dart';

class BadPage extends StatelessWidget {
  const BadPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Text('Bad Page'),
          ),
        ),
      ),
    );
  }
}
