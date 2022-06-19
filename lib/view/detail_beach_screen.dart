import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:halopantai/service/api_service.dart';
import 'package:halopantai/component/bottom_sheet_add_review.dart';
import 'package:halopantai/const/color.dart';
import 'package:halopantai/model/beach.dart';
import 'package:halopantai/model/review.dart';
import 'package:halopantai/model/service.dart';
import 'package:halopantai/service/firestore_service.dart';
import 'package:halopantai/view/review_card.dart';

class DetailBeachScreen extends StatelessWidget {
  final Beach beach;
  final int userId;
  const DetailBeachScreen({Key? key, required this.beach, required this.userId})
      : super(key: key);

  bool isListContainsBeach(List<Beach> beaches) {
    return beaches.map((it) => it.id).contains(beach.id);
  }

  void _showSnackbarReview(bool error, BuildContext context) {
    final snackbar = SnackBar(
      content: Text(!error
          ? 'Pantai berhasil ditambahkan ke daftar favorit'
          : 'Pantai berhasil dihapus dari daftar favorit'),
      backgroundColor: !error ? Colors.green : Colors.red,
      behavior: SnackBarBehavior.floating,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            width: double.infinity,
            height: 400,
            child: Stack(
              children: [
                Hero(
                  tag: beach.name,
                  child: Image.network(
                    beach.images![1].url,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 400,
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Color.fromRGBO(12, 16, 19, 0.5),
                    Color.fromRGBO(12, 16, 19, 0),
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
                ),
                Positioned(
                  top: 20,
                  left: 20,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Material(
                      child: InkWell(
                        onTap: () => Navigator.pop(context),
                        child: const SizedBox(
                          height: 48,
                          width: 48,
                          child: Center(
                            child: Icon(Icons.arrow_back),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                    top: 20,
                    right: 20,
                    child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('favorite_beach')
                          .doc(userId.toString())
                          .collection('beach')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          debugPrint('list docs ' +
                              snapshot.data!.docs.length.toString());
                          debugPrint('user id ' + userId.toString());

                          var beaches = (snapshot.data!.docs)
                              .map((beach) => Beach.fromSnapshot(beach
                                  as QueryDocumentSnapshot<
                                      Map<String, dynamic>>))
                              .toList();

                          debugPrint(
                              'list length ' + beaches.length.toString());

                          return ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Material(
                              child: InkWell(
                                onTap: () {
                                  if (isListContainsBeach(beaches)) {
                                    FirestoreService.removeFromFavorite(
                                        beach.id);
                                    _showSnackbarReview(true, context);
                                  } else {
                                    FirestoreService.addToFavorite(beach);
                                    _showSnackbarReview(false, context);
                                  }
                                },
                                child: SizedBox(
                                  height: 48,
                                  width: 48,
                                  child: Center(
                                    child: Icon(isListContainsBeach(beaches)
                                        ? Icons.star
                                        : Icons.star_border),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }
                        return Container(
                          height: 48,
                          width: 48,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12)),
                        );
                      },
                    )),
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Material(
                      child: InkWell(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(12))),
                              builder: (context) => BottomSheetAddReview(
                                    beachId: beach.id,
                                  ));
                        },
                        child: const SizedBox(
                          height: 48,
                          width: 156,
                          child: Center(
                              child: Text(
                            'Write Review',
                            style: TextStyle(fontSize: 14),
                          )),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.fromLTRB(20, 20, 20, 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  beach.name,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.w500),
                ),
                Text(
                  beach.address,
                  style: const TextStyle(color: AppColor.secondaryText),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(beach.description),
          ),
          const SizedBox(height: 24),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            height: 400,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Flexible(
                  flex: 1,
                  child: Container(
                    color: Colors.red,
                    child: Image.network(
                      beach.images![0].url,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Flexible(
                  flex: 1,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Flexible(
                        flex: 1,
                        child: Container(
                          color: Colors.blue,
                          child: Image.network(
                            beach.images![2].url,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Flexible(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Flexible(
                              flex: 1,
                              child: Container(
                                color: Colors.green,
                                child: Image.network(
                                  beach.images![3].url,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Flexible(
                              flex: 1,
                              child: Container(
                                color: Colors.yellow,
                                child: Image.network(
                                  beach.images![4].url,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            color: Color(0xffFCDDEC),
            thickness: 2,
            height: 24,
            endIndent: 20,
            indent: 20,
          ),
          FutureBuilder(
            future: ApiService.getBeachReviewsById(beach.id),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data is ServicesSuccess) {
                  var reviews =
                      (snapshot.data as ServicesSuccess).data as List<Review>;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          '${reviews.length} reviews',
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Container(
                        height: 250,
                        margin: const EdgeInsets.symmetric(vertical: 24),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: reviews.length + 1,
                          itemBuilder: (context, index) {
                            return index != reviews.length
                                ? ReviewCard(review: reviews[index])
                                : const SizedBox(width: 20);
                          },
                        ),
                      )
                    ],
                  );
                }
                return Container();
              }
              return const Center(child: CircularProgressIndicator());
            },
          )
        ],
      ),
    );
  }
}
