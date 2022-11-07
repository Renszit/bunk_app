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
                    decoration: const InputDecoration(
                      labelText: 'E-mail',
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'password',
                    ),
                  ),
                  TextButton(onPressed: onPressed, child: const Text('Login')),
                ],
              ),
            ),
          ),
        ));
  }

  void onPressed() {
    print('login');
  }
}
