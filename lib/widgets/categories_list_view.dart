import 'package:flutter/material.dart';
import 'package:news_app/models/card_model.dart';
import 'package:news_app/widgets/category_card.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({
    super.key,
  });

  final List<CardModel> cards = const [
    CardModel(image: "assets/business.avif", name: "Business"),
    CardModel(image: "assets/entertaiment.avif", name: "Entertaiment"),
    CardModel(image: "assets/general.avif", name: "General"),
    CardModel(image: "assets/health.avif", name: "Health"),
    CardModel(image: "assets/science.avif", name: "Science"),
    CardModel(image: "assets/sports.avif", name: "Sports"),
    CardModel(image: "assets/technology.jpeg", name: "Technology"),
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
            card: cards[index],
          );
        },
      ),
    );
  }
}
