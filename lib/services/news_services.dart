import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/models/category_model.dart';

import 'package:news_app/models/news_model.dart';


class NewsService extends ChangeNotifier {

  List<Article> headlines = [];
  List<Category> categories = [
    Category(FontAwesomeIcons.building, "business"),
    Category(FontAwesomeIcons.tv, "entertainment"),
    Category(FontAwesomeIcons.addressCard, "general"),
    Category(FontAwesomeIcons.headSideVirus, "health"),
    Category(FontAwesomeIcons.vials, "science"),
    Category(FontAwesomeIcons.volleyballBall, "sports"),
    Category(FontAwesomeIcons.memory, "technology"),
  ];

  Map<String, List<Article>> categoryArticles = {};

  final _baseURL = "newsapi.org";
  String _selectedCategory = "business";
  bool isLoading = false;


  NewsService(){

    this.getTopHeadlines();

    categories.forEach((item) { 

      this.categoryArticles[item.name] = [];

    });

    this.getArticlesByCategory(this._selectedCategory);

  }


  String get selectedCategory => this._selectedCategory;

  set selectedCategory(String valor) {

    this._selectedCategory = valor;

    this.getArticlesByCategory(valor);

    notifyListeners();

  }

  List<Article>? get articlesSelectedCategory => this.categoryArticles[this.selectedCategory];
    
  getTopHeadlines() async {
    
    final url = Uri.https(_baseURL, "/v2/top-headlines", {
      "apiKey": "3e5cb718a3e54552b835ffb78861047c",
      "country": "us"
    });

    final resp = await http.get(url);
    final newsResponse = NewsResponse.fromJson(resp.body);
    
    this.headlines.addAll(newsResponse.articles);
    notifyListeners();

  }


  getArticlesByCategory(String category) async {

    isLoading = true;

    if(this.categoryArticles[category]!.length > 0){
      isLoading = false;
      return this.categoryArticles[category];
    }

    final url = Uri.https(_baseURL, "/v2/top-headlines", {
      "apiKey": "3e5cb718a3e54552b835ffb78861047c",
      "country": "us",
      "category": category
    });

    final resp = await http.get(url);
    final newsResponse = NewsResponse.fromJson(resp.body);

    this.categoryArticles[category]!.addAll(newsResponse.articles);

    isLoading = false;
    notifyListeners();

  }

}