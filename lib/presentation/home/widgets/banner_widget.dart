import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/common/global_variables.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: GlobalVariables.bannerImage.map(
        (i) {
          return Builder(
            builder: (BuildContext contex) => Image.network(
              i,
              fit: BoxFit.contain,
            ),
          );
        },
      ).toList(),
      options: CarouselOptions(
        viewportFraction: 1,
        height: 130,
        autoPlay: true,
      ),
    );
  }
}
