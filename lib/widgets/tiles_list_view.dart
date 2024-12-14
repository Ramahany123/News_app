import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/articles_model.dart';
import 'package:news_app/services/news_services.dart';
import 'package:news_app/widgets/news_tile.dart';

class TilesListView extends StatefulWidget {
  const TilesListView({
    super.key,
  });

  @override
  State<TilesListView> createState() => _TilesListViewState();
}

class _TilesListViewState extends State<TilesListView> {
  List<ArticlesModel> articles = [];
  @override
  void initState() {
    super.initState();
    getNews();
  }

  Future<void> getNews() async {
    articles = await NewsServices(Dio()).getNews();
  }

  @override
  Widget build(BuildContext context) {
    // NewsServices(Dio()).getNews(); it isn't good to use it here because in build method might be invoked many times and the api costs money to make request
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: articles.length,
        (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 22),
            child: NewsTile(
              article: articles[index],
            ),
          );
        },
      ),
    );
    // this way isn't the best because when using it in CustomScrollView it will consum more resources
    // ListView.builder(
    //   shrinkWrap:
    //       true, // it makes it build all the items at the beginning of the app which will affect preformance
    //   physics:
    //       const NeverScrollableScrollPhysics(), //it doesn't make list scrollable ,so it doesn't expand in CustomScrollView
    //   itemCount: 10,
    //   itemBuilder: (context, index) {
    //     return const Padding(
    //       padding: EdgeInsets.only(bottom: 22),
    //       child: NewsTile(),
    //     );
    //   },
    // );
  }
}
