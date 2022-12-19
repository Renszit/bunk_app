import 'package:bunk_app/global/services/auth_functions.dart';
import 'package:bunk_app/main.dart';
import 'package:bunk_app/modules/appBar/bottom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Home extends ConsumerWidget {
  const Home({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userName = ref.watch(userProvider)?.user?.displayName;

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      bottomNavigationBar: const BottomAppBar(
        child: BottomAppBarContents(),
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
