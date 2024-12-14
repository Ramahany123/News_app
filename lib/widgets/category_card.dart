import 'package:flutter/material.dart';
import 'package:news_app/models/card_model.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.card});
  final CardModel card;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        right: 12,
      ),
      width: 200,
      height: 110,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: AssetImage(card.image),
          fit: BoxFit.fill,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.25),
            BlendMode.darken,
          ),
        ),
      ),
      child: Center(
          child: Text(
        card.name,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      )),
    );
  }
}
