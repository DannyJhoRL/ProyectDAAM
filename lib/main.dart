import 'package:flutter/material.dart';
import 'login_page.dart'; // <-- inicia en login

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,

      // Primera pantalla: LOGIN
      home: LoginPage(),
    );
  }
}
