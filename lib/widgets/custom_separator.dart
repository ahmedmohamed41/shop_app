
import 'package:flutter/material.dart';

class SeparatorBuilder extends StatelessWidget {
  const SeparatorBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        width: double.infinity,
        height: 0.3,
        color: Colors.grey,
      ),
    );
  }
}
