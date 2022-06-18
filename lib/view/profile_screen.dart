import 'package:flutter/material.dart';
import 'package:halopantai/const/color.dart';
import 'package:halopantai/controller/user_controller.dart';
import 'package:halopantai/view/login_or_regis_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

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
            FutureBuilder<String>(
              future: UserController().getUsername(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  debugPrint(snapshot.data!);
                  return Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.grey[200]),
                        child: Center(
                            child: Text(
                          getTwoLetterName(snapshot.data!),
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: AppColor.secondaryText),
                        )),
                      ),
                      const SizedBox(width: 16),
                      Text(
                        snapshot.data!,
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w500),
                      )
                    ],
                  );
                }
                return Container();
              },
            ),
            const SizedBox(height: 57),
            InkWell(
              onTap: () {
                UserController().removeUserData();

                // navigate to welcome screen
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginOrRegisterScreen(),
                    ),
                    (route) => false);
              },
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
