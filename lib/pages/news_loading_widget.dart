import 'package:flutter/material.dart';
import 'package:news_app_example/pages/news_page.dart';
import 'package:news_app_example/repository/news_repository.dart';

class NewsLoadingWidget extends StatefulWidget {
  const NewsLoadingWidget({super.key});

  @override
  State<NewsLoadingWidget> createState() => _NewsLoadingWidgetState();
}

class _NewsLoadingWidgetState extends State<NewsLoadingWidget> {
  final newsRepository = NewsRepository();

  late final articles = newsRepository.getArticle();

  @override
  void initState() {
    if (mounted) {
      articles.then((value) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewsPage(value!),
          ),
        );
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
