class ArticlesModel {
  final String title;
  final String description;
  final String? image;

  ArticlesModel(
      {required this.title, required this.description, required this.image});

  factory ArticlesModel.fromJson(json) {
    return ArticlesModel(
        title: json["title"],
        description: json["description"],
        image: json["image"]);
  }
}
