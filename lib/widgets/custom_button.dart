import 'package:flutter/material.dart';
import 'package:shop_app/shared/components/constaints.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    this.onTap,
    required this.text,
    super.key,
  });
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: kAppbarColor,
          borderRadius: BorderRadius.circular(8),
        ),
        height: 60,
        width: double.infinity,
        child: Center(
          child: Text(text),
        ),
      ),
    );
  }
}
