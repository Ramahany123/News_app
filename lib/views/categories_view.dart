import 'package:flutter/material.dart';
import 'package:news_app/widgets/tiles_list_view_builder.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key, required this.category});
  final String category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          TilesListViewBuilder(
            category: category,
          ),
        ],
      ),
    );
  }
}
