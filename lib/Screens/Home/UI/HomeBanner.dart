import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shopIT/Utils/Components/Size.dart';

class Homebanner extends StatelessWidget {
  Homebanner({super.key, });

  List<String> banners=[
    "assets/nike_banner_0.jpg",
    "assets/nike_banner_1.jpg",
    "assets/nike_banner_2.jpg",
    "assets/nike_banner_3.jpg",
    "assets/nike_banner_4.jpg",
    "assets/nike_banner_2.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
          height: Sizes.screenHeight*0.30,
          width:Sizes.screenWidth,
          color: Colors.blue,
          child: CarouselSlider(
            options: CarouselOptions(
              height: Sizes.screenHeight * 0.30,
              viewportFraction: 1,
              autoPlay: true,
            ),
            items: banners.map((banner) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: Sizes.screenWidth,
                    child: Image.asset(banner, fit: BoxFit.fill),
                  );
                },
              );
            }).toList(),
          )

      ),
    );
  }
}
