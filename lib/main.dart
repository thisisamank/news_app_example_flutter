import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:news_app_example/app_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    log('My App rebuild');
    return const MaterialApp(
      home: NewsLoadingWidget(),
    );
  }
}
