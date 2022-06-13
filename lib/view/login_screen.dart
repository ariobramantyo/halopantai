import 'package:flutter/material.dart';
import 'package:halopantai/const/color.dart';
import 'package:halopantai/view/navbar.dart';
import 'package:halopantai/view/register_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final _key = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Widget _formField(
      TextEditingController controller, String hint, bool obscure) {
    return SizedBox(
      height: 56,
      child: TextFormField(
        controller: controller,
        textAlignVertical: TextAlignVertical.center,
        style: const TextStyle(
          fontSize: 13,
          color: AppColor.dark,
        ),
        obscureText: obscure,
        decoration: InputDecoration(
            hintText: hint,
            hintStyle:
                const TextStyle(fontSize: 13, color: AppColor.secondaryText),
            filled: true,
            fillColor: AppColor.placeHolder,
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(12))),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Form tidak boleh kosong';
          }
          return null;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'HaloPantai',
              style: TextStyle(
                  fontSize: 32,
                  color: AppColor.main,
                  fontWeight: FontWeight.w800,
                  fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 34),
            Form(
                key: _key,
                child: Column(
                  children: [
                    _formField(_emailController, 'Email', false),
                    const SizedBox(height: 34),
                    _formField(_passwordController, 'Password', true),
                  ],
                )),
            const SizedBox(height: 80),
            ElevatedButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NavBar(),
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
            const SizedBox(height: 26),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'No account? ',
                  style: TextStyle(fontSize: 14),
                ),
                InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegisterScreen(),
                      )),
                  child: const Text(
                    'Register',
                    style: TextStyle(fontSize: 14, color: AppColor.main),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
