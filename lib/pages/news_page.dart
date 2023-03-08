import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_example/constants/colors.dart';
import 'package:news_app_example/models/article_response.dart';
import 'package:news_app_example/size_util.dart';

class NewsPage extends StatefulWidget {
  const NewsPage(this.articles, {super.key});

  final List<Article> articles;

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    // log('News page rebuild');
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: CardSwiper<Widget>(
          cards: [
            ...widget.articles.map((e) => ArticleCard(e)),
          ],
        ),
      ),
    );
  }
}

class ArticleCard extends StatelessWidget {
  ArticleCard(this.article, {super.key});

  final Article article;
  final randomColor = AppColors
      .pastelColors[Random().nextInt(AppColors.pastelColors.length - 1)];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: randomColor, borderRadius: BorderRadius.circular(20)),
      height: context.height * .5,
      width: context.width * .7,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            TextPill(article.source.name),
            const SizedBox(height: 12),
            Text(
              article.title,
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Published on ${_getFormattedDate(article.publishedAt)}",
              style: GoogleFonts.outfit(
                fontSize: 16,
                color: Colors.grey.shade700,
              ),
            ),
            Text(
              "Author : ${article.author}",
              style: GoogleFonts.outfit(
                fontSize: 16,
                color: Colors.grey.shade700,
              ),
            ),
            const SizedBox(height: 18),
            Expanded(
              child: Text(
                article.description,
                style: GoogleFonts.outfit(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getFormattedDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year} at ${date.hour}:${date.minute}';
  }
}

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
