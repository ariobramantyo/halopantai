import 'package:flutter/material.dart';
import 'package:halopantai/const/color.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColor.main,
      body: Center(
        child: Text(
          'HaloPantai',
          style: TextStyle(
              fontSize: 32,
              color: Colors.white,
              fontWeight: FontWeight.w800,
              fontStyle: FontStyle.italic),
        ),
      ),
    );
  }
}
