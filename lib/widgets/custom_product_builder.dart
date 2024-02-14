import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/model/home_model.dart';
import 'package:shop_app/widgets/custom_grid_view_builder.dart';


class CustomProductBuilder extends StatelessWidget {
 const CustomProductBuilder(this.model,{super.key});
  final HomeModel? model;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CarouselSlider(
          items: model!.data!.banners
              .map(
                (e) => Image(
                  image: NetworkImage('${e.image}'),
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              )
              .toList(),
          options: CarouselOptions(
            height: 200,
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
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          color: Colors.grey,
          child: GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 1.0,
            crossAxisSpacing: 1.0,
            crossAxisCount: 2,
            childAspectRatio: 1 / 1.3,
            children: List.generate(
              model!.data!.products.length,
              (index) => CustomGridViewBuilder(model!.data!.products[index]),
            ),
          ),
        ),
      ],
    );
  }
}
