import 'package:bunk_app/modules/auth/bunk_home.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
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
      home: const BunkHome(title: 'Bunk Home'),
    );
  }
}
