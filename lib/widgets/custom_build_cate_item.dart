import 'package:flutter/material.dart';
import 'package:shop_app/model/categories_model.dart';

class CustomBuildCateItem extends StatelessWidget {
  const CustomBuildCateItem({super.key, required this.categoriesModel});
  final DataModel1 categoriesModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 80,
          width: 80,
          child: Image.network(
            '${categoriesModel.image}',
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Center(
          child: Text(
            '${categoriesModel.name}',
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_forward_ios_outlined,
          ),
        ),
      ],
    );
  }
}
