import 'package:flutter/material.dart';
import 'package:halopantai/service/api_service.dart';
import 'package:halopantai/component/dialog_custom.dart';
import 'package:halopantai/component/loading_dialog.dart';
import 'package:halopantai/const/color.dart';
import 'package:halopantai/model/login_response.dart';
import 'package:halopantai/model/service.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  final _key = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final snackbar = const SnackBar(
    content: Text('Password tidak sama'),
    backgroundColor: Colors.red,
    behavior: SnackBarBehavior.floating,
  );

  void clearTExtField() {
    _nameController.text = '';
    _passwordController.text = '';
    _confirmPasswordController.text = '';
    _emailController.text = '';
  }

  bool isEmailformat(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  Widget _formField(
      TextEditingController controller, String hint, bool obscure) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: controller,
        textAlignVertical: TextAlignVertical.center,
        style: const TextStyle(
          fontSize: 13,
          color: AppColor.dark,
        ),
        obscureText: obscure,
        decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            hintText: hint,
            hintStyle:
                const TextStyle(fontSize: 13, color: AppColor.secondaryText),
            filled: true,
            fillColor: AppColor.placeHolder,
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(12))),
        validator: (value) {
          if (hint == "Email") {
            if (!isEmailformat(value!)) {
              return 'Format email tidak tepat';
            }
          }
          if (hint == 'Password') {
            if (value!.length < 8) {
              return 'Password harus setidaknya memiliki 8 karakter';
            }
          }
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
      body: ListView(
        children: [
          const SizedBox(height: 60),
          const Center(
            child: Text(
              'HaloPantai',
              style: TextStyle(
                  fontSize: 32,
                  color: AppColor.main,
                  fontWeight: FontWeight.w800,
                  fontStyle: FontStyle.italic),
            ),
          ),
          const SizedBox(height: 34),
          Form(
              key: _key,
              child: Column(
                children: [
                  _formField(_nameController, 'Name', false),
                  const SizedBox(height: 34),
                  _formField(_emailController, 'Email', false),
                  const SizedBox(height: 34),
                  _formField(_passwordController, 'Password', true),
                  const SizedBox(height: 34),
                  _formField(
                      _confirmPasswordController, 'Confirm Password', true),
                ],
              )),
          const SizedBox(height: 80),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
              onPressed: () async {
                if (_key.currentState!.validate()) {
                  if (_confirmPasswordController.text !=
                      _passwordController.text) {
                    ScaffoldMessenger.of(context).showSnackBar(snackbar);
                  } else {
                    LoadingDialog.showLoadingDialog(context);

                    var response = await ApiService.register(
                        _nameController.text,
                        _emailController.text,
                        _passwordController.text);

                    LoadingDialog.dismissDialog(context);
                    if (response is ServicesSuccess) {
                      debugPrint((response.data as User).name);
                      showDialog(
                        context: context,
                        builder: (_) => const DialogCustom(
                            error: false,
                            message:
                                'Registrasi berhasil, silahkan kembali ke halaman login untuk masuk ke dalam aplikasi'),
                      );
                    } else {
                      response = response as ServicesFailure;
                      showDialog(
                        context: context,
                        builder: (_) => const DialogCustom(
                            error: true,
                            message:
                                'Terjadi kesalahan, silahkan coba lagi nanti'),
                      );

                      debugPrint(response.errMsg);
                    }
                  }
                }
              },
              child: const Text(
                'Register',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(MediaQuery.of(context).size.width, 56),
                  primary: AppColor.main,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
          const SizedBox(height: 26),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Have account? ',
                style: TextStyle(fontSize: 14),
              ),
              InkWell(
                onTap: () => Navigator.pop(context),
                child: const Text(
                  'Login',
                  style: TextStyle(fontSize: 14, color: AppColor.main),
                ),
              )
            ],
          ),
          const SizedBox(height: 25),
        ],
      ),
    );
  }
}
