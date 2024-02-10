
import 'package:flutter/material.dart';
import 'package:shop_app/model/boarding_model.dart';

class BoardingItem extends StatelessWidget {
  const BoardingItem({
    super.key, required this.model,
  });
  final BoardingModel model;
  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          image: AssetImage(model.image),
        ),
        const SizedBox(
          height: 60,
        ),
        Text(
          model.title,
          style: const TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          model.body,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

