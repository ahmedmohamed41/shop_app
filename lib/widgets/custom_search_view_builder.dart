import 'package:flutter/material.dart';
import 'package:shop_app/model/search_model.dart';
import 'package:shop_app/shared/components/constaints.dart';

class CustomSearchViewBuilder extends StatelessWidget {
  const CustomSearchViewBuilder({super.key, required this.model});
  final ProductModel model;
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
                    '${model.image}',
                  ),
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
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${model.name}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const Spacer(),
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
                      backgroundColor: Colors.grey,
                      child: IconButton(
                        onPressed: () {},
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
