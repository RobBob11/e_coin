// Modelos de datos para los listados de monedas, ver quicktype para más información

import 'dart:convert';

List<Coin> coinFromJson(String str) =>
    List<Coin>.from(json.decode(str).map((x) => Coin.fromJson(x)));

List<List<double>> chartDataFromMap(String str) => List<List<double>>.from(
    json.decode(str).map((x) => List<double>.from(x.map((x) => x.toDouble()))));

class Coin {
  Coin({
    required this.id,
    required this.name,
    required this.image,
    required this.currentPrice,
    required this.priceChange24H,
    required this.priceChangePercentage24H,

    // sec
    required this.symbol,
    required this.marketCap,
    required this.marketCapRank,
    required this.totalVolume,
    required this.high24H,
    required this.low24H,
    required this.marketCapChange24H,
    required this.marketCapChangePercentage24H,
    required this.circulatingSupply,
    required this.totalSupply,
    required this.maxSupply,
  });

  String id;
  String name;
  String image;
  double currentPrice;
  double priceChange24H;
  double priceChangePercentage24H;

  // sec
  String symbol;
  int marketCap;
  int marketCapRank;
  double totalVolume;
  double high24H;
  double low24H;
  double marketCapChange24H;
  double marketCapChangePercentage24H;
  double circulatingSupply;
  double totalSupply;
  double maxSupply;

  factory Coin.fromJson(Map<String, dynamic> json) => Coin(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        currentPrice: json["current_price"].toDouble(),
        priceChange24H: json["price_change_24h"].toDouble(),
        priceChangePercentage24H:
            json["price_change_percentage_24h"].toDouble(),
        symbol: json["symbol"],
        marketCap: json["market_cap"],
        marketCapRank: json["market_cap_rank"],
        totalVolume: json["total_volume"].toDouble(),
        high24H: json["high_24h"].toDouble(),
        low24H: json["low_24h"].toDouble(),
        marketCapChange24H: json["market_cap_change_24h"].toDouble(),
        marketCapChangePercentage24H:
            json["market_cap_change_percentage_24h"].toDouble(),
        circulatingSupply: json["circulating_supply"].toDouble(),
        totalSupply:
            json["total_supply"] == null ? 0 : json["total_supply"].toDouble(),
        maxSupply:
            json["max_supply"] == null ? 0 : json["max_supply"].toDouble(),
      );
}
