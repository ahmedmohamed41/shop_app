import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/model/home_model.dart';

class CustomCarouselSlider extends StatelessWidget {
  const CustomCarouselSlider({
    super.key,
    required this.model,
  });

  final HomeModel? model;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: model!.data!.banners.map((e) {
        return Image(
          
          image: NetworkImage('${e.image }'),
          width: double.infinity,
          fit: BoxFit.cover,
        );
      }).toList(),
      options: CarouselOptions(
        height: 180,
        enableInfiniteScroll: true,
        initialPage: 0,
        viewportFraction: 1.0,
        reverse: false,
        autoPlay: true,
        autoPlayAnimationDuration: const Duration(seconds: 1),
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayCurve: Curves.fastOutSlowIn,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}

