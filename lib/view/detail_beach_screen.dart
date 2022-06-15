import 'package:flutter/material.dart';
import 'package:halopantai/const/color.dart';
import 'package:halopantai/model/beach.dart';
import 'package:halopantai/model/review.dart';
import 'package:halopantai/view/review_card.dart';

class DetailBeachScreen extends StatelessWidget {
  final Beach beach;
  const DetailBeachScreen({Key? key, required this.beach}) : super(key: key);

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
                    beach.imageUrl,
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
                  child: Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    child: const Center(
                      child: Icon(Icons.star),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Material(
                      child: InkWell(
                        onTap: (() {}),
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
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  beach.name,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.w500),
                ),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.end,
                  children: [
                    Text(
                      '${beach.address} • ',
                      style: const TextStyle(color: AppColor.secondaryText),
                    ),
                    const Icon(
                      Icons.star,
                      color: Colors.green,
                    ),
                    Text(
                      '${beach.rating}',
                      style: const TextStyle(color: AppColor.secondaryText),
                    ),
                    Text(
                      ' Reviews (${beach.ratingCount})',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(beach.description),
          ),
          const Divider(
            color: Color(0xffFCDDEC),
            thickness: 2,
            height: 48,
            endIndent: 20,
            indent: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              '${beach.rating} (${beach.ratingCount} reviews)',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
          Container(
            height: 250,
            margin: const EdgeInsets.symmetric(vertical: 24),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: listReview.length + 1,
              itemBuilder: (context, index) {
                return index != listReview.length
                    ? ReviewCard(review: listReview[index])
                    : const SizedBox(width: 20);
              },
            ),
          )
        ],
      ),
    );
  }
}
