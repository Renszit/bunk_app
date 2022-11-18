import 'dart:math';

import 'package:bunk_app/global/common/toggle_button_icon.dart';
import 'package:bunk_app/global/utils/validators.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../registration_page.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  String email = '';
  String password = '';

  final DatabaseReference _testRef =
      FirebaseDatabase.instance.ref().child('test');

  void onPressed() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      _testRef.set('Hello World ${Random().nextInt(100)}');
      //TODO: add login logic

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Processing Data')),
      );

      Navigator.pushNamedAndRemoveUntil(
          context, '/home', ModalRoute.withName('/Dashboard'));
    }
  }

  void handleTogglePress() {
    setState(() {
      _obscureText = !_obscureText;
    });
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
                onSaved: (value) {
                  email = value!;
                },
                decoration: const InputDecoration(
                  labelText: 'E-mail',
                ),
                validator: (input) => input!.isValidEmail()
                    ? null
                    : 'Please enter a valid email address',
              ),
              TextFormField(
                onSaved: (value) {
                  password = value!;
                },
                enableSuggestions: false,
                obscureText: _obscureText,
                decoration: InputDecoration(
                    labelText: 'password',
                    suffixIcon: ToggleButton(
                      isEnabled: true,
                      onPressed: handleTogglePress,
                    )),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please check your password';
                  }
                  return null;
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(onPressed: onPressed, child: const Text('Login')),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const Registration(
                                title: 'Registration page')));
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
