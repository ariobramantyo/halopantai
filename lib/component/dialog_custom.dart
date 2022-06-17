import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class DialogCustom extends StatelessWidget {
  final bool error;
  final String message;
  const DialogCustom({Key? key, required this.error, required this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: SizedBox(
        height: 280,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset(
                  !error
                      ? 'assets/images/lottie_success.json'
                      : 'assets/images/lottie_warning.json',
                  height: 100),
              const SizedBox(height: 25),
              Text(
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 12),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(100, 30),
                      primary: error ? Colors.red : Colors.green,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: const Text('Tutup'))
            ],
          ),
        ),
      ),
    );
  }
}
