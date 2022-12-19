import 'package:bunk_app/global/common/toggle_button_icon.dart';
import 'package:bunk_app/global/services/auth_functions.dart';

import 'package:bunk_app/global/utils/validators.dart';
import 'package:bunk_app/main.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../registration_page.dart';

class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({super.key});

  @override
  LoginFormState createState() => LoginFormState();
}

class LoginFormState extends ConsumerState<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  String email = '';
  String password = '';

  void onPressed() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      Auth.loginUser(email, password).then((val) => {
            if (val is UserCredential)
              {
                ref.read(userProvider.notifier).state = val,
                Navigator.pushNamedAndRemoveUntil(
                    context, '/home', ModalRoute.withName('/Dashboard'))
              }
            else
              {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Error $val')),
                )
              }
          });
    }
  }

  void handleTogglePress() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void forgotPassWordAction() {
    Navigator.pushNamed(context, '/forgotPassword');
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
                  TextButton(
                      onPressed: forgotPassWordAction,
                      child: const Text('forgot password'))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
