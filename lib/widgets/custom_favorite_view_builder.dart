import 'package:flutter/material.dart';
import 'package:shop_app/model/favorite_model.dart';
import 'package:shop_app/module/home/cubit/shop_cubit.dart';
import 'package:shop_app/shared/components/constaints.dart';

class CustomFavoriteViewBuilder extends StatelessWidget {
  const CustomFavoriteViewBuilder({super.key, required this.model});
  final DataModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: 150,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              SizedBox(
                width: 130,
                height: 150,
                child: Image(
                  image: NetworkImage(
                    '${model.product!.image}',
                  ),
                ),
              ),
              if (model.product!.discount != 0)
                Container(
                  height: 15,
                  width: 55,
                  color: Colors.deepOrange,
                  child: const Text(
                    ' DISCOUNT',
                    style: TextStyle(
                      fontSize: 8.0,
                    ),
                  ),
                )
            ],
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${model.product!.name}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const Spacer(),
                Row(
                  children: [
                    Text(
                      '${model.product!.price}',
                      style: const TextStyle(
                        fontSize: 10,
                        color: defaultColor,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    if (model.product!.discount != 0)
                      Text(
                        '${model.product!.oldPrice}',
                        style: const TextStyle(
                          fontSize: 8,
                          color: Colors.grey,
                        ),
                      ),
                    const Spacer(),
                    CircleAvatar(
                      radius: 20,
                      backgroundColor:
                          ShopCubit.get(context).favorites[model.product!.id]!
                              ? defaultColor
                              : Colors.grey,
                      child: IconButton(
                        onPressed: () {
                          ShopCubit.get(context)
                              .changeFavorites(model.product!.id!);
                        },
                        icon: const Icon(
                          Icons.favorite_border,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
