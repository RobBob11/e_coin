import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:e_coin/models/coins.dart';

final _URL_API_TOP_20 =
    'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=20&page=1&sparkline=false';

class ServiceHome with ChangeNotifier {
  List<Coin> topMonedas = [];

  ServiceHome() {
    this.getTopMonedas();
  }

  getTopMonedas() async {
    final urlTop = Uri.parse(_URL_API_TOP_20);
    final response = await http.get(urlTop);
    final data = coinFromJson(response.body);
    this.topMonedas.addAll(data);
    notifyListeners();
    print("al 100");
  }

}
