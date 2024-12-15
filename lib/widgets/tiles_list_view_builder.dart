import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/articles_model.dart';
import 'package:news_app/services/news_services.dart';
import 'package:news_app/widgets/erorr_message.dart';
import 'package:news_app/widgets/tiles_list_view.dart';

class TilesListViewBuilder extends StatefulWidget {
  const TilesListViewBuilder({super.key});

  @override
  State<TilesListViewBuilder> createState() => _TilesListViewBuilderState();
}

class _TilesListViewBuilderState extends State<TilesListViewBuilder> {
  var future;
  @override
  void initState() {
    super.initState();
    future = NewsServices(Dio()).getNews();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticlesModel>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return TilesListView(articles: snapshot.data!);
        } else if (snapshot.hasError) {
          return const SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: ErorrMssg(message: "OOPS There was an ERORR!!!"),
            ),
          );
        } else {
          return const SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
