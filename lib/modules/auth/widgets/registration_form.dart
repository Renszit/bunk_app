import 'package:bunk_app/global/utils/validators.dart';
import 'package:flutter/material.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();

  void onPressed() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Processing Data')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(),
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'E-mail',
                ),
                validator: (input) => input!.isValidEmail()
                    ? null
                    : 'Please enter a valid email address',
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'First name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please check your name';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please fill in your password';
                  }
                  return null;
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        print('register with: ${_formKey.currentState}');
                      },
                      child: const Text('register')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
