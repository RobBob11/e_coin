import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:e_coin/models/coins.dart';

// resoluciones
bool isOldScreen(BuildContext context) =>
    MediaQuery.of(context).size.width <= 480;

class ListaDetalles extends StatelessWidget {
  late final Coin coin;

  ListaDetalles(this.coin);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      children: [
        Column(
          children: [
            _CoinImgDetails(coin),
            _CurrenPriceDetails(coin),
            _PriceChangeDetails(coin),
          ],
        ),
        Card(
          margin: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
          elevation: 0.5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: Column(children: [
            _CardItem(coin, const AssetImage('assets/img/rank.png'), 'Ranking',
                '#' + coin.marketCapRank.toString()),
            _CardItem(coin, const AssetImage('assets/img/name.png'), 'Nombre',
                coin.name),
            _CardItem(
                coin, const AssetImage('assets/img/id.png'), 'ID', coin.symbol),
            _CardItem(coin, const AssetImage('assets/img/money.png'),
                'Capital de mercado', '\$' + coin.marketCap.toString()),
            _CardItem(
                coin,
                const AssetImage('assets/img/marketCha.png'),
                'Variación del mercado',
                coin.marketCapChangePercentage24H.toString() + '%'),
            _CardItem(coin, const AssetImage('assets/img/max.png'),
                'Máximo 24h', '\$' + coin.high24H.toString()),
            _CardItem(coin, const AssetImage('assets/img/min.png'),
                'Mínimo 24h', '\$' + coin.low24H.toString()),
            _CardItem(coin, const AssetImage('assets/img/supplyC.png'),
                'Suministro actual', coin.circulatingSupply.toString()),
            _CardItem(coin, const AssetImage('assets/img/supplyT.png'),
                'Suministro total', coin.totalSupply.toString()),
          ]),
        )
      ],
    );
  }
}

// imagen de la moneda
class _CoinImgDetails extends StatelessWidget {
  late final Coin coin;

  _CoinImgDetails(this.coin);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 30.0, bottom: 15.0),
      child: Container(
          constraints: const BoxConstraints(maxHeight: 90),
          child: Image(
            image: NetworkImage(coin.image),
            width: 90,
          )),
    );
  }
}

// precio actual
class _CurrenPriceDetails extends StatelessWidget {
  late final Coin coin;

  _CurrenPriceDetails(this.coin);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Text('\$' + coin.currentPrice.toString(),
          style: Theme.of(context).textTheme.headline2),
    );
  }
}

// cambio de precio en 24h
class _PriceChangeDetails extends StatelessWidget {
  late final Coin coin;

  _PriceChangeDetails(this.coin);

  @override
  Widget build(BuildContext context) {
    return Text(
      coin.priceChangePercentage24H.toString() + '%',
      style: GoogleFonts.montserrat(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: coin.priceChangePercentage24H < 0 ? Colors.red : Colors.green),
    );
  }
}

// Card
class _CardItem extends StatelessWidget {
  late final Coin coin;
  late String label;
  late String data;
  late AssetImage image;

  _CardItem(this.coin, this.image, this.label, this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Image(
                  image: image,
                  width: 20.0,
                  color: HexColor("#4054E9"),
                ),
              ),
              Text(label, style: Theme.of(context).textTheme.bodyText1)
            ],
          ),
          Text(data, style: Theme.of(context).textTheme.bodyText1),
        ],
      ),
    );
  }
}
