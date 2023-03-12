import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_example/constants/colors.dart';
import 'package:news_app_example/models/article_response.dart';
import 'package:news_app_example/pages/widgets/article_card.dart';

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
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                "News App",
                style: GoogleFonts.poppins(
                  fontSize: 32,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: CardSwiper<Widget>(
                  cards: [
                    ...widget.articles.map((e) => ArticleCard(e)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
