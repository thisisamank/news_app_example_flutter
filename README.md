
# News App

Took help of Chat GPT to generate this, but is edited well to suit our needs :).

## Overview
This is a Flutter-based News App that allows users to read the latest news from various sources. It has two main pages: one to display the list of news articles and another to display a selected news article. The app consumes RESTful APIs to fetch news articles and display them in a user-friendly interface.

This README file will focus on how the REST APIs work and how they are integrated into the app.

The design is inspired from [this](https://dribbble.com/shots/20391043-News-App) dribble design.

### Demo
![Demo Video](./public/news_app_demo.gif)

## REST APIs
REST stands for Representational State Transfer. It is an architectural style that defines a set of constraints to be used when creating web services. RESTful APIs are web services that conform to these constraints. They are a popular way of building web services because they are simple, scalable, and easy to use.

REST APIs are based on the `HTTP` protocol, which is the same protocol used by web browsers to communicate with web servers. The `HTTP` protocol defines a set of methods that can be used to interact with a web server. The most common methods used in REST APIs are `GET`, `POST`, `PUT`, and `DELETE`.

### HTTP Methods
`GET`: retrieves a resource from the server.
`POST`: creates a new resource on the server.
`PUT`: updates an existing resource on the server.
`DELETE`: deletes a resource from the server.

### REST API Endpoints
A REST API endpoint is a URL that represents a specific resource or collection of resources. For this app we are using these:

```dart
  static const String baseUrl = 'newsapi.org';
  static const String everything = 'everything';
  static const String headlines = 'top-headlines';
```

### News App Implementation

Our News App fetches the latest news articles using the Top headlines endpoint of the News API. We make an HTTP GET request to the endpoint and parse the JSON response to extract the necessary information, such as the article title, description, and image.

We use the `http` package in Flutter to make HTTP requests to the API. The http package provides several functions to make HTTP requests, such as get, post, put, and delete.

Here's an example of how we fetch news articles using the http package:

```dart
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
```
In this example, we make an HTTP `GET` request to the everything endpoint of the News API with the `http.get` function. We parse the JSON response using the `jsonDecode` function and extract the articles list from the response. We then map each article JSON object to an Article object using the Article.fromJson constructor.

We then pass this List of articles to `CardSwiper` widget which is coming from `flutter_card_swiper` package.

```dart
CardSwiper<Widget>(
    cards: [
    ...widget.articles.map((e) => ArticleCard(e)),
    ],
)
```

When a user taps on an article, we navigate to the Article page and pass the article object as a parameter. We display the article details on this page, including the title, description, image, and content.