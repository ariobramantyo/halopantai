import 'package:flutter/material.dart';
import 'package:halopantai/const/color.dart';
import 'package:halopantai/model/review.dart';

class ReviewCard extends StatelessWidget {
  final Review review;
  const ReviewCard({Key? key, required this.review}) : super(key: key);

  String getTwoLetterName(String name) {
    var names = name.toUpperCase().split(' ');
    if (names.length >= 2) {
      return '${names[0][0]}${names[1][0]}';
    }
    return names[0].characters.first;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 242,
      width: 350,
      margin: const EdgeInsets.only(left: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(width: 1, color: AppColor.stroke),
      ),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.grey[200]),
                child: Center(
                    child: Text(
                  getTwoLetterName(review.name),
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: AppColor.secondaryText),
                )),
              ),
              const SizedBox(width: 11),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    review.name,
                    style: const TextStyle(fontSize: 16),
                  ),
                  Text(
                    review.time,
                    style: const TextStyle(color: AppColor.secondaryText),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 24),
          Text(
            review.descReview,
            maxLines: 6,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
