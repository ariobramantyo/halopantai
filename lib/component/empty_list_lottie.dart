import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:halopantai/const/color.dart';
import 'package:lottie/lottie.dart';

class EmptyContentLottie extends StatelessWidget {
  const EmptyContentLottie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 2 / 3,
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 250,
              width: 250,
              child: Lottie.asset('assets/images/lottie_empty_content.json'),
            ),
            const Text(
              'Belum ada pantai yang kamu tambahkan ke dalam daftar favorit mu',
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColor.secondaryText),
            )
          ],
        ),
      ),
    );
  }
}
