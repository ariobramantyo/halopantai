import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:halopantai/controller/user_controller.dart';
import 'package:halopantai/view/login_or_regis_screen.dart';
import 'package:halopantai/view/navbar.dart';
import 'package:halopantai/view/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Halo Pantai',
      theme: ThemeData(fontFamily: 'Poppins'),
      home: FutureBuilder<String>(
        future: UserController().getEmail(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data == '') {
              return const LoginOrRegisterScreen();
            } else {
              return NavBar();
            }
          }
          return const SplashScreen();
        },
      ),
    );
  }
}
