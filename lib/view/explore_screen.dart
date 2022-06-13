import 'package:flutter/material.dart';
import 'package:halopantai/const/color.dart';
import 'package:halopantai/model/beach.dart';
import 'package:halopantai/view/beach_card.dart';

class ExploreScreen extends StatelessWidget {
  ExploreScreen({Key? key}) : super(key: key);

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
            'Explore Pantai',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: screenSize.width <= 600 ? 2 : 4,
                  crossAxisSpacing: 18,
                  mainAxisSpacing: 22,
                  childAspectRatio: screenSize.width <= 600
                      ? (screenSize.width / 2) /
                          ((screenSize.width / 2 - 30) + 150)
                      : (screenSize.width / 4) / 310),
              itemCount: beachList.length,
              itemBuilder: (context, index) {
                return BeachCard(beach: beachList[index]);
              }),
        )
      ],
    ));
  }
}
