import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BeachCardShimmer extends StatelessWidget {
  const BeachCardShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

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
                  ? (screenSize.width / 2) / ((screenSize.width / 2 - 30) + 150)
                  : (screenSize.width / 4) / 310),
          itemCount: 8,
          itemBuilder: (context, index) {
            return Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[200]!,
              child: SizedBox(
                width: screenSize.width / 2 - 10,
                height:
                    screenSize.width <= 600 ? screenSize.width / 2 - 30 : 180,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 187,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey[200]),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      height: 10,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey[200]),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      height: 10,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey[200]),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
