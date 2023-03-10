import 'package:http/http.dart' as http;
import 'package:news_app_example/constants/endpoints.dart';
import 'package:news_app_example/models/article_response.dart';
import 'package:news_app_example/secrets.dart';

class NewsRepository {
  Future<List<Article>?> getArticle() async {
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
      return articleResponse.articles;
    } else {
      return null;
    }
  }
}
