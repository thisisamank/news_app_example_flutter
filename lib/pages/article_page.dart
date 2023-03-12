import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_example/constants/colors.dart';
import 'package:news_app_example/models/article_response.dart';
import 'package:news_app_example/pages/widgets/text_pill_widget.dart';

class ArticlePage extends StatelessWidget {
  const ArticlePage(
    this.article, {
    super.key,
    required this.bgColor,
  });
  final Article article;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.background),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              article.title,
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 12),
            TextPill(article.source.name),
            const SizedBox(height: 12),
            Text(
              "Published on ${_getFormattedDate(article.publishedAt)}",
              style: GoogleFonts.outfit(
                fontSize: 16,
                color: Colors.grey.shade700,
              ),
            ),
            const SizedBox(height: 12),
            if (article.urlToImage != null)
              Image.network(
                article.urlToImage!,
              ),
            const SizedBox(height: 24),
            Text(
              article.description,
              style: GoogleFonts.outfit(fontSize: 20),
            ),
            const SizedBox(height: 12),
            RichText(
              selectionColor: Colors.black,
              text: TextSpan(
                text: 'Read more ',
                style: GoogleFonts.outfit(
                  fontSize: 20,
                  color: AppColors.background,
                ),
                children: const [
                  TextSpan(
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                    text: "here.",
                  ),
                ],
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
