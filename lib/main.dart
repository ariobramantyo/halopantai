import 'package:flutter/material.dart';
import 'package:halopantai/view/login_or_regis_screen.dart';
import 'package:halopantai/view/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Halo Pantai',
      theme: ThemeData(fontFamily: 'Poppins'),
      home: FutureBuilder(
        future: Future.delayed(const Duration(seconds: 3)),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return const LoginOrRegisterScreen();
          }
          return const SplashScreen();
        },
      ),
    );
  }
}
