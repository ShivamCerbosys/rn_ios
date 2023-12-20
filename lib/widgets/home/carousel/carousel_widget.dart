import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ration_now/widgets/home/carousel/carouselitem.dart';
// import 'package:ration_now/widgets/home/carousel/carouselitem.dart';

class MyCarouselWithStack extends StatelessWidget {
  final List<Map<String, dynamic>> carouselData = [
    // Add more data as needed
    {
      'backgroundImage': 'assets/images/promo1.png',
      'title': 'New',
      'subtitle': 'GET 35% off',
    },
    {
      'backgroundImage': 'assets/images/promo1.png',
      'title': 'New ',
      'subtitle': 'GET 5% off',
    },
    {
      'backgroundImage': 'assets/images/promo1.png',
      'title': 'New',
      'subtitle': 'GET 10% off',
    },
    {
      'backgroundImage': 'assets/images/promo1.png',
      'title': 'New',
      'subtitle': 'GET 35% off',
    },
  ];

  MyCarouselWithStack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return CarouselSlider(
      options: CarouselOptions(
        height: screenWidth > screenHeight ? 350 : 225,
        autoPlay: false,
        viewportFraction: 1.0,
        enableInfiniteScroll: false,
      ),
      items: carouselData.map((data) {
        return Builder(
          builder: (BuildContext context) {
            return StackCarouselItem(
              backgroundImage: data['backgroundImage'],
              title: data['title'],
              subtitle: data['subtitle'],
              onPressed: () {
                // Handle button press
              },
            );
          },
        );
      }).toList(),
    );
  }
}
