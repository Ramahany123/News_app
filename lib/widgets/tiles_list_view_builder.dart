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
    if (isLoading) {
      return const SliverFillRemaining(
        hasScrollBody: false,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else if (articles.isNotEmpty) {
      return TilesListView(articles: articles);
    } else {
      return SliverFillRemaining(
        hasScrollBody: false,
        child: Center(
          child: Text(
            "OOPS There was an ERORR!!!",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.redAccent,
                shadows: [
                  Shadow(
                    color: Colors.black.withOpacity(0.3),
                    offset: const Offset(2, 2),
                    blurRadius: 4,
                  )
                ]),
          ),
        ),
      );
    }
  }
}
