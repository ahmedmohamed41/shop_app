import 'package:flutter/material.dart';
import 'package:shop_app/model/home_model.dart';
import 'package:shop_app/module/home/cubit/shop_cubit.dart';
import 'package:shop_app/shared/components/constaints.dart';

class CustomGridViewBuilder extends StatelessWidget {
  const CustomGridViewBuilder(this.model, {super.key});
  final ProductModel model;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: AlignmentDirectional.topStart,
            children: [
              Center(
                child: Image(
                  image: NetworkImage('${model.image}'),
                  height: 120,
                  // width: double.infinity,
                  // fit: BoxFit.cover,
                ),
              ),
              if (model.discount != 0)
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
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${model.name}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      '${model.price}',
                      style: const TextStyle(
                        fontSize: 10,
                        color: defaultColor,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    if (model.discount != 0)
                      Text(
                        '${model.oldPrice}',
                        style: const TextStyle(
                          fontSize: 8,
                          color: Colors.grey,
                        ),
                      ),
                    const Spacer(),
                    CircleAvatar(
                      radius: 20,
                      backgroundColor:
                          ShopCubit.get(context).favorites[model.id]!
                              ? defaultColor
                              : Colors.grey,
                      child: IconButton(
                        onPressed: () {
                          ShopCubit.get(context).changeFavorites(model.id!);
                         
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
          )
        ],
      ),
    );
  }
}
