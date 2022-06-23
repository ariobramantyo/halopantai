import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:halopantai/component/beach_card_shimmer.dart';
import 'package:halopantai/component/empty_list_lottie.dart';
import 'package:halopantai/controller/user_controller.dart';
import 'package:halopantai/model/beach.dart';
import 'package:halopantai/view/beach_card.dart';
import 'package:halopantai/view/detail_beach_screen.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
        body: ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Text(
            'Favorite',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
          ),
        ),
        FutureBuilder<int>(
          future: UserController().getUserId(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('favorite_beach')
                      .doc(snapshot.data.toString())
                      .collection('beach')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var beaches = (snapshot.data!.docs)
                          .map((beach) => Beach.fromSnapshot(beach
                              as QueryDocumentSnapshot<Map<String, dynamic>>))
                          .toList();

                      return snapshot.data!.docs.isNotEmpty
                          ? Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 35),
                              child: GridView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount:
                                              screenSize.width <= 600 ? 2 : 4,
                                          crossAxisSpacing: 18,
                                          mainAxisSpacing: 22,
                                          childAspectRatio: screenSize.width <=
                                                  600
                                              ? (screenSize.width / 2) /
                                                  ((screenSize.width / 2 - 30) +
                                                      150)
                                              : (screenSize.width / 4) / 310),
                                  itemCount: beaches.length,
                                  itemBuilder: (context, index) {
                                    // print(index);
                                    return InkWell(
                                      onTap: () async {
                                        final userId =
                                            await UserController().getUserId();
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailBeachScreen(
                                                beach: beaches[index],
                                                userId: userId,
                                              ),
                                            ));
                                      },
                                      child: BeachCard(beach: beaches[index]),
                                    );
                                  }),
                            )
                          : const EmptyContentLottie();
                    } else if (snapshot.hasError) {
                      return const EmptyContentLottie();
                    }
                    return const BeachCardShimmer();
                  });
            }
            return const BeachCardShimmer();
          },
        ),
      ],
    ));
  }
}
