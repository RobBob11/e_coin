import 'package:e_coin/models/noticias.dart';
import 'package:e_coin/services/news_data.dart';
import 'package:e_coin/widgets/customAppbar.dart';
import 'package:e_coin/widgets/lista_news.dart';
import 'package:e_coin/widgets/no_connection.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class News extends StatefulWidget {
  const News({Key? key}) : super(key: key);

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> with AutomaticKeepAliveClientMixin {
  // intancia de la clase para el servicio
  NewsData newsData = NewsData();
  // lista noticias
  late Future<List<Article>?> data;
  // internet checker
  bool internetState = true;

  @override
  void initState() {
    super.initState();
    // call internet connection checker method
    InternetConnectionChecker().onStatusChange.listen((status) {
      final hasInternet = (status == InternetConnectionStatus.connected);
      setState(() {
        internetState = hasInternet;
      });
    });
    data = newsData.getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarspl("Noticias", context),
        // check for internet connection
        body: (internetState == true)
            ? FutureBuilder<List<Article>?>(
                future: data,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    final error = snapshot.error;
                    return Text('bad');
                  } else if (snapshot.hasData) {
                    List<Article>? news = snapshot.data;
                    return RefreshIndicator(
                      onRefresh: () async {
                        setState(() {
                          data = newsData.getNews();
                        });
                      },
                      child: Container(
                          margin: const EdgeInsets.all(10.0),
                          child: ListaNoticias(news!)),
                    );
                  } else {
                    return const Center(
                        child: Image(
                      image: AssetImage('assets/img/loadingDataTr.gif'),
                      width: 80,
                    ));
                  }
                },
              )
            : const NoConnection());
  }

  @override
  bool get wantKeepAlive => true;
}