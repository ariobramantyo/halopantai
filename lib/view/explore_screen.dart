import 'package:flutter/material.dart';
import 'package:halopantai/component/beach_card_shimmer.dart';
import 'package:halopantai/controller/user_controller.dart';
import 'package:halopantai/service/api_service.dart';
import 'package:halopantai/const/color.dart';
import 'package:halopantai/model/beach.dart';
import 'package:halopantai/model/service.dart';
import 'package:halopantai/view/beach_card.dart';
import 'package:halopantai/view/detail_beach_screen.dart';

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
        FutureBuilder<dynamic>(
          future: ApiService.getAllBeach(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data is ServicesSuccess) {
                var listBeach =
                    (snapshot.data as ServicesSuccess).data as List<Beach>;
                return Padding(
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
                      itemCount: listBeach.length,
                      itemBuilder: (context, index) {
                        // print(index);
                        return InkWell(
                          onTap: () async {
                            final userId = await UserController().getUserId();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailBeachScreen(
                                    beach: listBeach[index],
                                    userId: userId,
                                  ),
                                ));
                          },
                          child: BeachCard(beach: listBeach[index]),
                        );
                      }),
                );
              }

              return Container();
            }

            return const BeachCardShimmer();
          },
        )
      ],
    ));
  }
}
