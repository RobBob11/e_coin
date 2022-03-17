import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/noticias.dart';
import '../widgets/customAppbar.dart';
import '../widgets/lista_news.dart';

final _URL =
    'https://newsapi.org/v2/everything?q=cripto+bitcoin+criptomonedas&language=es&sortBy=publishedAt';
final _APIKEY = '407215122500484e9fdd8792c9cc1b67';

class News extends StatefulWidget {
  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> with AutomaticKeepAliveClientMixin {
  // lista noticias
  List<Article> news = [];
  // fechas para las noticias
  // fecha actual completa
  var _currentDate;
  // para armar
  var _year;
  var _month;
  var _day;

  @override
  void initState() {
    _currentDate = DateTime.now().toIso8601String();
    _year = DateTime.now().year;
    _month = DateTime.now().month;
    _day = DateTime.now().day;
    reloadNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarspl("Noticias"),
      body: RefreshIndicator(
        onRefresh: reloadNews,
        child:
            Container(margin: EdgeInsets.all(10.0), child: ListaNoticias(news)),
      ),
    );
  }

  // traer las noticias
  Future reloadNews() async {
    try {
      final url = Uri.parse(
          '$_URL&from=$_year-$_month-00&to=$_currentDate&apiKey=$_APIKEY');
      final response = await http.get(url);
      final data = modeloNoticiaFromJson(response.body);
      news = [];
      if (this.mounted) {
        setState(() {
          news.addAll(data.articles);
        });
      }
      print(news.length);
    } catch (e) {
      print(e);
    }
  }

  @override
  bool get wantKeepAlive => true;
}
