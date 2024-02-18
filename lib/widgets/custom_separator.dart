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
        width: 20.0,
        height: 0.3,
        color: Colors.grey,
      ),
    );
  }
}

class CustomMyDivider extends StatelessWidget {
  const CustomMyDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Container(
        width: 150,
        height: 0.3,
        color: Colors.grey,
      ),
    );
  }
}
