import 'package:flutter/material.dart';
import 'widgets/registration_form.dart';

class Registration extends StatelessWidget {
  const Registration({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration'),
      ),
      body: Container(
        decoration: const BoxDecoration(),
        child: const Center(
          child: RegistrationForm(),
        ),
      ),
    );
  }
}
