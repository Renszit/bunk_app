import 'package:flutter/material.dart';

import 'widgets/login_form.dart';

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
        body: Column(
          children: const [
            SizedBox(
                width: 300,
                height: 300,
                child: Center(child: Icon(Icons.bed_outlined, size: 100))),
            LoginForm(),
          ],
        ));
  }
}
