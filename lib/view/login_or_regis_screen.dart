import 'package:flutter/material.dart';
import 'package:halopantai/const/color.dart';
import 'package:halopantai/view/login_screen.dart';
import 'package:halopantai/view/register_screen.dart';

class LoginOrRegisterScreen extends StatelessWidget {
  const LoginOrRegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/login_or_regis_bg.png'))),
        ),
        Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromRGBO(18, 12, 19, 1.0),
            Color.fromRGBO(12, 16, 19, 0.12),
          ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 40, right: 40, bottom: 80),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text(
                'Selamat datang di halopantai Platform Informasi Pantai di Pulau Bali',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    )),
                child: const Text(
                  'Login',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                ),
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(MediaQuery.of(context).size.width, 56),
                    primary: AppColor.main,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegisterScreen(),
                    )),
                child: const Text(
                  'Daftar',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: AppColor.main),
                ),
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(MediaQuery.of(context).size.width, 56),
                    elevation: 0,
                    primary: Colors.transparent,
                    side: const BorderSide(width: 2, color: AppColor.main),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
              )
            ],
          ),
        )
      ],
    ));
  }
}
