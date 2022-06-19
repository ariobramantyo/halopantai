import 'package:flutter/material.dart';
import 'package:halopantai/service/api_service.dart';
import 'package:halopantai/component/loading_dialog.dart';
import 'package:halopantai/const/color.dart';

class BottomSheetAddReview extends StatefulWidget {
  final int beachId;
  const BottomSheetAddReview({Key? key, required this.beachId})
      : super(key: key);

  @override
  State<BottomSheetAddReview> createState() => _BottomSheetAddReviewState();
}

class _BottomSheetAddReviewState extends State<BottomSheetAddReview> {
  final _textController = TextEditingController();

  void _showSnackbarReview(bool error) {
    final snackbar = SnackBar(
      content: Text(!error
          ? 'Review berhasil ditambahkan'
          : 'Terjadi kesalahan harap coba lagi nanti'),
      backgroundColor: !error ? Colors.green : Colors.red,
      behavior: SnackBarBehavior.floating,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 2,
              width: 40,
              margin: const EdgeInsets.only(bottom: 20, top: 20),
              color: AppColor.secondaryText,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: _textController,
                textAlignVertical: TextAlignVertical.center,
                style: const TextStyle(
                  fontSize: 13,
                  color: AppColor.dark,
                ),
                minLines: 4,
                maxLines: 5,
                autofocus: true,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    hintText: 'Tulis review mu disini',
                    hintStyle: const TextStyle(
                        fontSize: 13, color: AppColor.secondaryText),
                    filled: true,
                    fillColor: AppColor.placeHolder,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(12))),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Review tidak boleh kosong';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (_textController.text.isNotEmpty) {
                  LoadingDialog.showLoadingDialog(context);

                  var response = await ApiService.postReview(
                      _textController.text, widget.beachId);

                  LoadingDialog.dismissDialog(context);
                  Navigator.pop(context);
                  _showSnackbarReview(response);
                }
              },
              child: const Text('Kirim'),
              style: ElevatedButton.styleFrom(
                  fixedSize: const Size(100, 46),
                  primary: AppColor.main,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
