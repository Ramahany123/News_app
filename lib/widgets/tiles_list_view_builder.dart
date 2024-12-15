import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/articles_model.dart';
import 'package:news_app/services/news_services.dart';
import 'package:news_app/widgets/tiles_list_view.dart';

class TilesListViewBuilder extends StatefulWidget {
  const TilesListViewBuilder({super.key});

  @override
  State<TilesListViewBuilder> createState() => _TilesListViewBuilderState();
}

class _TilesListViewBuilderState extends State<TilesListViewBuilder> {
  List<ArticlesModel> articles = [];
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    getNews();
  }

  Future<void> getNews() async {
    articles = await NewsServices(Dio()).getNews();
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : TilesListView(articles: articles);
  }
}
