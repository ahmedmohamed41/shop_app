import 'package:flutter/material.dart';
import 'package:shop_app/model/home_model.dart';
import 'package:shop_app/shared/components/constaints.dart';

class CustomGridViewBuilder extends StatelessWidget {
  const CustomGridViewBuilder(this.products, {super.key});
  final ProductModel products;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Center(
                child: Image(
                  image: NetworkImage('${products.image}'),
                  height: 120,
                  // width: double.infinity,
                  // fit: BoxFit.cover,
                ),
              ),
              if (products.discount != 0)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Container(
                    height: 15,
                    width: 55,
                    color: defaultColor,
                    child: const Text(
                      ' DISCOUNT',
                      style: TextStyle(
                        fontSize: 8.0,
                      ),
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
                  '${products.name}',
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
                      '${products.price}',
                      style: const TextStyle(
                        fontSize: 10,
                        color: defaultColor,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    if (products.discount != 0)
                      Text(
                        '${products.oldPrice}',
                        style: const TextStyle(
                          fontSize: 8,
                          color: Colors.grey,
                        ),
                      ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.favorite_border),
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
