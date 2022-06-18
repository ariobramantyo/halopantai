import 'package:flutter/material.dart';
import 'package:halopantai/const/color.dart';
import 'package:lottie/lottie.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({Key? key}) : super(key: key);

  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
        body: ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 50,
                width: screenSize.width - 80,
                child: TextFormField(
                  controller: _searchController,
                  textAlignVertical: TextAlignVertical.bottom,
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppColor.dark,
                  ),
                  decoration: InputDecoration(
                      hintText: 'Cari Pantai',
                      hintStyle: const TextStyle(
                          fontSize: 13, color: AppColor.secondaryText),
                      filled: true,
                      fillColor: AppColor.placeHolder,
                      prefixIcon: const Icon(
                        Icons.search,
                        color: AppColor.secondaryText,
                      ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(12))),
                ),
              ),
              const Icon(
                Icons.tune,
                size: 28,
              )
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: Text(
            'Favorite',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
          ),
        ),
        Padding(
            padding: const EdgeInsets.fromLTRB(40, 100, 40, 0),
            child: Column(
              children: [
                SizedBox(
                  height: 250,
                  width: 250,
                  child:
                      Lottie.asset('assets/images/lottie_empty_content.json'),
                ),
                const Text(
                  'Belum ada pantai yang kamu tambahkan ke dalam daftar favorit mu',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: AppColor.secondaryText),
                )
              ],
            ))
      ],
    ));
  }
}
