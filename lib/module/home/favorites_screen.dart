import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/module/home/cubit/shop_cubit.dart';
import 'package:shop_app/widgets/custom_favorite_view_builder.dart';
import 'package:shop_app/widgets/custom_separator.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(right: 15, left: 15),
          child: ConditionalBuilder(
            condition: state is! ShopLoadingGetFavoritesStates,
            builder: (context) => ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => CustomFavoriteViewBuilder(
                model: ShopCubit.get(context).favoriteModel!.data!.data[index],
              ),
              separatorBuilder: (context, index) => const CustomMyDivider(),
              itemCount: ShopCubit.get(context).favoriteModel!.data!.data.length,
            ),
            fallback: (context) =>
                const Center(child: CircularProgressIndicator()),
          ),
        );
      },
    );
  }
}
