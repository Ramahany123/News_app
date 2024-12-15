import 'package:flutter/material.dart';
import 'package:news_app/widgets/categories_list_view.dart';
import 'package:news_app/widgets/tiles_list_view_builder.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "News",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Cloud",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 247, 173, 37),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(child: CategoriesListView()),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 32,
                ),
              ),
              TilesListViewBuilder(),
            ],
          ),
        ));
  }
}
