import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../models/coins.dart';

class ListaTop extends StatelessWidget {
  late final List<Coin> coins;

  ListaTop(this.coins);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: this.coins.length,
        itemBuilder: (context, int i) {
          return _Coin(coin: coins[i]);
        });
  }
}

// contenedor de las coins
class _Coin extends StatelessWidget {
  late final Coin coin;

  _Coin({required this.coin});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      elevation: 0.5,
      margin: EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Expanded(child: _CoinImg(coin)),
          Expanded(child: _CoinName(coin)),
          Expanded(child: _PriceChange(coin)),
          Expanded(child: _CurrenPrice(coin)),
          Expanded(child: _SeeMore(coin)),
        ],
      ),
    );
  }
}

// nombre moneda
class _CoinName extends StatelessWidget {
  late final Coin coin;

  _CoinName(this.coin);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        coin.name,
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 15.0, color: Colors.black),
      ),
    );
  }
}

//icono coin
class _CoinImg extends StatelessWidget {
  late final Coin coin;

  _CoinImg(this.coin);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.0),
      child: Container(
          constraints: BoxConstraints(maxHeight: 30),
          child: Image(
            image: NetworkImage(coin.image),
            width: 30,
          )),
    );
  }
}

// cambio de precio en 24h
class _PriceChange extends StatelessWidget {
  late final Coin coin;

  _PriceChange(this.coin);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text(
      coin.priceChangePercentage24H.toString() + '%',
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 13.0,
          color: coin.priceChange24H < 0 ? Colors.red : Colors.green),
    ));
  }
}

// precio actual
class _CurrenPrice extends StatelessWidget {
  late final Coin coin;

  _CurrenPrice(this.coin);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text(
      '\$' + coin.currentPrice.toString(),
      style: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 13.0, color: Colors.black),
    ));
  }
}

class _SeeMore extends StatelessWidget {
  late final Coin coin;

  _SeeMore(this.coin);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(
          onPressed: () => {},
          icon: ImageIcon(
            AssetImage('assets/img/plus.png'),
            color: HexColor("#4054E9"),
            size: 20.0,
          )),
    );
  }
}
