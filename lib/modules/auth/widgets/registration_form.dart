import 'package:bunk_app/global/common/toggle_button_icon.dart';
import 'package:bunk_app/global/services/auth_functions.dart';
import 'package:bunk_app/global/utils/validators.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  String email = '';
  String password = '';
  String firstName = '';

  void onPressed() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();

      Auth.createUser(email, password).then(((value) async => {
            if (value is UserCredential)
              {
                await Auth.updateUser(firstName),
                Navigator.pushNamedAndRemoveUntil(
                    context, '/home', ModalRoute.withName('/Dashboard'))
              }
            else
              {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Error $value')),
                )
              }
          }));
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
                onSaved: (val) {
                  email = val!;
                },
                decoration: const InputDecoration(
                  labelText: 'E-mail',
                ),
                validator: (input) => input!.isValidEmail()
                    ? null
                    : 'Please enter a valid email address',
              ),
              TextFormField(
                onSaved: (val) {
                  firstName = val!;
                },
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
                onSaved: (val) {
                  password = val!;
                },
                obscureText: _obscureText,
                decoration: InputDecoration(
                    labelText: 'Password',
                    suffixIcon: ToggleButton(
                      isEnabled: true,
                      onPressed: handleTogglePress,
                    )),
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
                      onPressed: onPressed, child: const Text('register')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
