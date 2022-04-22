import 'package:http/http.dart' as http;
import '../models/noticias.dart';

// url para la api de newsOrg
const urlNews =
    'https://newsapi.org/v2/everything?q=cripto+bitcoin+criptomonedas&language=es&sortBy=publishedAt&apiKey=407215122500484e9fdd8792c9cc1b67';
const apiKey = '407215122500484e9fdd8792c9cc1b67';

class NewsData {
  // obtener la fecha actual del dispositivo para las noticias más recientes
  final _currentDate = DateTime.now().toIso8601String();
  final _year = DateTime.now().year;
  final _month = DateTime.now().month;

  NewsData() {}

  // realizar la petición http
  Future<List<Article>?> getNews() async {
    // lista para almacenar las noticias
    List<Article> news = [];
    try {
      news = [];
      final url = Uri.parse(
          '$urlNews&from=$_year-$_month-00&to=$_currentDate&apiKey=$apiKey');
      final response = await http.get(url);
      final data = modeloNoticiaFromJson(response.body);
      news.addAll(data.articles);
    } catch (error) {}

    return news;
  }
}