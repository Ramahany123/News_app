import 'package:flutter/material.dart';
import 'package:news_app/models/card_model.dart';
import 'package:news_app/widgets/category_card.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({
    super.key,
  });

  final List<CategoryModel> cards = const [
    CategoryModel(image: "assets/business.avif", name: "Business"),
    CategoryModel(image: "assets/entertaiment.avif", name: "Entertainment"),
    CategoryModel(image: "assets/health.avif", name: "Health"),
    CategoryModel(image: "assets/science.avif", name: "Science"),
    CategoryModel(image: "assets/sports.avif", name: "Sports"),
    CategoryModel(image: "assets/technology.jpeg", name: "Technology"),
    CategoryModel(image: "assets/general.avif", name: "General"),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: cards.length,
        itemBuilder: (context, index) {
          return CategoryCard(
            category: cards[index],
          );
        },
      ),
    );
  }
}
