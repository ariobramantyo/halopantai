import 'package:flutter/material.dart';
import 'package:halopantai/const/color.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  final _name = "Mark Spector";

  String getTwoLetterName(String name) {
    var names = name.toUpperCase().split(' ');
    if (names.length >= 2) {
      return '${names[0][0]}${names[1][0]}';
    }
    return names[0].characters.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.grey[200]),
                  child: Center(
                      child: Text(
                    getTwoLetterName(_name),
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: AppColor.secondaryText),
                  )),
                ),
                const SizedBox(width: 16),
                Text(
                  _name,
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.w500),
                )
              ],
            ),
            const SizedBox(height: 57),
            InkWell(
              onTap: () {},
              child: const Text(
                'Log out',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline,
                    color: Color(0xffDF2626)),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Version 1.00',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColor.secondaryText),
            )
          ],
        ),
      ),
    ));
  }
}
