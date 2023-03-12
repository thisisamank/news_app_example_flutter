import 'package:flutter/material.dart';

class NewsLoadingWidget extends StatefulWidget {
  const NewsLoadingWidget({super.key});

  @override
  State<NewsLoadingWidget> createState() => _NewsLoadingWidgetState();
}

class _NewsLoadingWidgetState extends State<NewsLoadingWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
