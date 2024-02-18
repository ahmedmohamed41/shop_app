import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/module/home/cubit/shop_cubit.dart';
import 'package:shop_app/widgets/custom_build_cate_item.dart';
import 'package:shop_app/widgets/custom_separator.dart';

class CategoeiesScreen extends StatelessWidget {
  const CategoeiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(right: 7, left: 15),
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => CustomBuildCateItem(
              
                categoriesModel:
                    ShopCubit.get(context).categoriesModel!.data!.data[index]),
            separatorBuilder: (context, index) => const CustomMyDivider(),
            itemCount:
                ShopCubit.get(context).categoriesModel!.data!.data.length,
          ),
        );
      },
    );
  }
}
