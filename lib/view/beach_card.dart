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
          Hero(
            tag: beach.name,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(
                  height: 187,
                  child: Image.network(
                    beach.images![1].url,
                    // 'https://i2.wp.com/blog.tripcetera.com/id/wp-content/uploads/2020/03/leebudihart_76864081_2484833498431751_3194446755026370817_n-1024x768.jpg',
                    fit: BoxFit.cover,
                  )),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                const Icon(
                  Icons.location_on,
                  color: Colors.green,
                  size: 12,
                ),
                SizedBox(
                  width: 120,
                  child: Text(
                    beach.address,
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
