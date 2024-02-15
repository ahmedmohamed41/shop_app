import 'package:flutter/material.dart';
import 'package:shop_app/model/categories_model.dart';

class CustomBuildCategoryItem extends StatelessWidget {
  const CustomBuildCategoryItem({super.key, required this.categoriesModel});
  final DataModel categoriesModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        SizedBox(
          height: 100,
          child: Image.network(
            '${categoriesModel.image}',
            fit: BoxFit.cover,
          ),
        ),
        Container(
          width: 100,
          height: 20,
          color: Colors.black45,
          child: Center(
            child: Text(
              '${categoriesModel.name}',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
