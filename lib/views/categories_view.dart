import 'package:flutter/material.dart';
import 'package:news_app/widgets/tiles_list_view_builder.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key, required this.category});
  final String category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 247, 173, 37),
        elevation: 8,
        title: Text(
          category.toUpperCase(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(22),
            sliver: TilesListViewBuilder(
              category: category,
            ),
          ),
        ],
      ),
    );
  }
}
