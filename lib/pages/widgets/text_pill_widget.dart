import 'package:flutter/material.dart';
import 'package:news_app_example/constants/colors.dart';

class TextPill extends StatelessWidget {
  const TextPill(
    this.text, {
    super.key,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 2,
        ),
        decoration: BoxDecoration(
            color: AppColors.red, borderRadius: BorderRadius.circular(12)),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ));
  }
}
