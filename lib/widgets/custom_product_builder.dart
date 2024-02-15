import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/model/home_model.dart';
import 'package:shop_app/module/home/cubit/shop_cubit.dart';
import 'package:shop_app/widgets/custom_build_category_item.dart';
import 'package:shop_app/widgets/custom_carousel_slider.dart';
import 'package:shop_app/widgets/custom_grid_view_builder.dart';

class CustomProductBuilder extends StatelessWidget {
  const CustomProductBuilder(this.model, {super.key});
  final HomeModel? model;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = ShopCubit.get(context).categoriesModel!.data!.data;
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomCarouselSlider(model: model),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Categories',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 100,
                width: double.infinity,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) =>
                      CustomBuildCategoryItem(categoriesModel: list[index]),
                  separatorBuilder: (context, index) => Container(
                    color: Colors.white,
                    width: 20.0,
                  ),
                  itemCount: list.length,
                ),
              ),
              const Text(
                'New Products',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
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
                    (index) =>
                        CustomGridViewBuilder(model!.data!.products[index]),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

