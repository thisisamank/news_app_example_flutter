import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_example/constants/colors.dart';
import 'package:news_app_example/models/article_response.dart';
import 'package:news_app_example/pages/article_page.dart';
import 'package:news_app_example/pages/widgets/text_pill_widget.dart';
import 'package:news_app_example/size_util.dart';

class ArticleCard extends StatelessWidget {
  ArticleCard(this.article, {super.key});

  final Article article;
  final randomColor = AppColors
      .pastelColors[Random().nextInt(AppColors.pastelColors.length - 1)];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ArticlePage(article, bgColor: randomColor),
        ));
      },
      child: Container(
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
      ),
    );
  }

  String _getFormattedDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year} at ${date.hour}:${date.minute}';
  }
}
