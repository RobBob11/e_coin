import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/noticias.dart';

final _URL = 'https://newsapi.org/v2';
final _APIKEY = '407215122500484e9fdd8792c9cc1b67';

class ServiceNews with ChangeNotifier {
  List<Article> NoticiasTop = [];

  ServiceNews() {
    this.getNoticias();
  }

  getNoticias() async {
    try {
      final _url = Uri.parse(
          'https://newsapi.org/v2/top-headlines?q=cripto&category=business&language=es&apiKey=$_APIKEY');
      final response = await http.get(_url);
      final resultado = modeloNoticiaFromJson(response.body);
      this.NoticiasTop.addAll(resultado.articles);
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }
}
