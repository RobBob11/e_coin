import 'package:e_coin/models/coins.dart';
import 'package:http/http.dart' as http;

// url para el top 20
const url_20 =
    'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=20&page=1&sparkline=false';

class CoinsData {
  CoinsData() {}

  // realizar la peticion http para las 20 primeras monedas
  Future<List<Coin>?> getCoins() async {
    // lista para almacenar las monedas
    List<Coin>? coins = [];
    try {
      coins = [];
      final url = Uri.parse(url_20);
      final response = await http.get(url);
      final data = coinFromJson(response.body);
      coins.addAll(data);
    } catch (error) {}

    return coins;
  }
}