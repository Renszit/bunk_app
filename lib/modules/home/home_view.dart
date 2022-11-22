import 'package:bunk_app/global/services/Auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.title});

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final user = Auth.getUser();

  @override
  Widget build(BuildContext context) {
    var userName = user.displayName ?? user.email;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        decoration: const BoxDecoration(),
        child: Center(
            child: TextButton(
          onPressed: () {
            Auth.signOut().then(
                (value) => {Navigator.pushReplacementNamed(context, '/')});
          },
          child: Text('logout $userName'),
        )),
      ),
    );
  }
}
