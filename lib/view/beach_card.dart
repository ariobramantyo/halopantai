import 'package:flutter/material.dart';
import 'package:halopantai/const/color.dart';
import 'package:halopantai/model/beach.dart';

class BeachCard extends StatelessWidget {
  final Beach beach;
  const BeachCard({Key? key, required this.beach}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Container(
      width: screenSize.width / 2 - 10,
      height: screenSize.width <= 600 ? screenSize.width / 2 - 30 : 180,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
                height: 187,
                child: Image.network(
                  beach.imageUrl,
                  fit: BoxFit.cover,
                )),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.green,
                  size: 12,
                ),
                SizedBox(
                  width: 120,
                  child: Text(
                    ' ${beach.rating}(${beach.ratingCount}) • ${beach.category}',
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 11, color: AppColor.secondaryText),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              beach.name,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 12, color: AppColor.dark),
            ),
          )
        ],
      ),
    );
  }
}
