import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

//TODO: implement logic for forgot password

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password'),
      ),
      body: Container(
        decoration: const BoxDecoration(),
        child: const Center(
          child: Text('Forgot Password'),
        ),
      ),
    );
  }
}
