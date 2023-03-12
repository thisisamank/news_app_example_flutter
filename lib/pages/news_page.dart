import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_example/constants/colors.dart';
import 'package:news_app_example/models/article_response.dart';
import 'package:news_app_example/pages/widgets/article_card.dart';
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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "News App",
          style: GoogleFonts.poppins(
            fontSize: 32,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SizedBox(
            height: context.height * .6,
            width: context.width * .8,
            child: CardSwiper<Widget>(
              cards: [
                ...widget.articles.map((e) => ArticleCard(e)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
