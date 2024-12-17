class ArticlesModel {
  final String title;
  final String description;
  final String? image;
  final String url;

  ArticlesModel(
      {required this.title,
      required this.description,
      required this.url,
      required this.image});

  factory ArticlesModel.fromJson(json) {
    return ArticlesModel(
        title: json["title"],
        description: json["description"],
        url: json["url"],
        image: json["image"]);
  }
}
