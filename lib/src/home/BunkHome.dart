import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/foundation.dart' as Foundation;

class BunkHome extends StatefulWidget {
  const BunkHome({super.key, required String title});

  @override
  State<BunkHome> createState() => _BunkHomeState();
}

class _BunkHomeState extends State<BunkHome> {
  final emailFieldController = TextEditingController();
  final passwordFieldController = TextEditingController();

  @override
  void initState() {
    super.initState();
    emailFieldController.addListener(_printLatestValue);
    passwordFieldController.addListener(_printLatestValue);
  }

  @override
  void dispose() {
    emailFieldController.dispose();
    passwordFieldController.dispose();
    super.dispose();
  }

  void _printLatestValue() {
    print('text  1 field} ${emailFieldController.text}');
    print('text  2field} ${passwordFieldController.text}');
  }

  void onPressed() {
    print(
        'login with following data: ${emailFieldController.text} and ${passwordFieldController.text}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Bunk Home'),
        ),
        body: Container(
          decoration: const BoxDecoration(),
          child: Form(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    key: const Key('email'),
                    controller: emailFieldController,
                    decoration: const InputDecoration(
                      labelText: 'E-mail',
                    ),
                  ),
                  TextFormField(
                    key: const Key('password'),
                    controller: passwordFieldController,
                    decoration: const InputDecoration(
                      labelText: 'password',
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: onPressed, child: const Text('Login')),
                      TextButton(
                          onPressed: onPressed, child: const Text('register')),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
