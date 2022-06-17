import 'package:flutter/material.dart';

class LoadingDialog {
  static showLoadingDialog(BuildContext context) {
    AlertDialog alertLoading = AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10),
          const CircularProgressIndicator(),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: const Text('Harap tunggu...'),
          )
        ],
      ),
    );

    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return alertLoading;
        });
  }

  static dismissDialog(BuildContext context) => Navigator.pop(context);
}
