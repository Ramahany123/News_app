import 'package:dio/dio.dart';
import 'package:news_app/models/articles_model.dart';

class NewsServices {
  final Dio dio;
  NewsServices(this.dio);
  Future<List<ArticlesModel>> getNews() async {
    var response = await dio.get(
        "https://gnews.io/api/v4/top-headlines?category=general&apikey=b8414ec5eca1364a7d89a9ca48d8ada4&country=us");
    var jsonData = response.data;
    // you can determine the type of the data from the json file or you can use var or dynamic
    // Map<String, dynamic> jsonData2 = response.data;

    List<dynamic> articles = jsonData["articles"];
    List<ArticlesModel> articleslist = [];
    for (var article in articles) {
      articleslist.add(ArticlesModel(
          title: article["title"],
          description: article["description"],
          image: article["image"]));
      print(article["image"]);
    }
    return articleslist;
  }
}
