import 'package:bunk_app/modules/auth/bunk_home.dart';
import 'package:bunk_app/modules/home/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'modules/auth/forgot_password.dart';

final userProvider = StateProvider.autoDispose<UserCredential?>((ref) => null);

Future<void> main() async => {
      WidgetsFlutterBinding.ensureInitialized(),
      runApp(ProviderScope(child: MyApp()))
    };

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: const ColorScheme(
            primary: Color(0xFFe0e0e0),
            background: Color(0xFF829191),
            brightness: Brightness.light,
            error: Color(0xFF2c423F),
            onBackground: Color(0xFF4C5B61),
            secondary: Color(0xFF455a64),
            onError: Color(0xFF2c423F),
            onPrimary: Color(0xFF212121),
            onSecondary: Color(0xFFd4e157),
            onSurface: Color(0xFFC5C5C5),
            surface: Color(0xFF2c423F),
          ),
        ),
        home: FutureBuilder(
          future: _fbApp,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              // print('You have an error! ${snapshot.error.toString()}');
              return const Text('Something went wrong');
            } else if (snapshot.hasData) {
              return const BunkHome(title: 'Login');
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
        routes: {
          '/home': (context) => const Home(title: 'Dashboard'),
          '/forgotPassword': (context) => const ForgotPassword(),
        });
  }
}
