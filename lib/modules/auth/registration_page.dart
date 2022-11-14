import 'package:flutter/material.dart';
import 'widgets/registration_form.dart';

class Registration extends StatefulWidget {
  const Registration({super.key, required String title});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
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
