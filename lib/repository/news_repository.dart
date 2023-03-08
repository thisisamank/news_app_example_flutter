import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:news_app_example/constants/endpoints.dart';
import 'package:news_app_example/models/article_response.dart';
import 'package:news_app_example/secrets.dart';

class NewsRepository {
  List<Article>? _cachedArticles;
  Future<List<Article>?> getArticle() async {
    if (_cachedArticles == null) {
      final response = await http.get(
        Uri(
          scheme: 'https',
          host: NewsApiEndpoints.baseUrl,
          pathSegments: ['v2', NewsApiEndpoints.everything],
          queryParameters: {
            'apiKey': apiKey,
            'q': 'bitcoin',
          },
        ),
      );

      if (response.statusCode == 200) {
        final articleResponse = ArticleResponse.fromJson(response.body);
        log('API called');
        _cachedArticles = articleResponse.articles;
        return _cachedArticles;
      } else {
        return null;
      }
    }
    return _cachedArticles;
  }
}
