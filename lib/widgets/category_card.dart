import 'package:flutter/material.dart';
import 'package:news_app/models/card_model.dart';
import 'package:news_app/views/categories_view.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.category});
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoriesView(
              category: category.name.toLowerCase(),
            ),
          ),
        );
        print(category.name.toLowerCase());
      },
      child: Container(
        margin: const EdgeInsets.only(
          right: 12,
        ),
        width: 200,
        height: 110,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            image: AssetImage(category.image),
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.25),
              BlendMode.darken,
            ),
          ),
        ),
        child: Center(
            child: Text(
          category.name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        )),
      ),
    );
  }
}
