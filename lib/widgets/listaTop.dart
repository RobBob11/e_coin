import 'package:e_coin/models/coins.dart';
import 'package:e_coin/pages/detalles_moneda.dart';
import 'package:e_coin/services/chart_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

class ListaTop extends StatelessWidget {
  late final List<Coin> coins;

  ListaTop(this.coins);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        itemCount: coins.length,
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
      elevation: 0.5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Expanded(child: _CoinImg(coin)),
          Expanded(child: _CoinName(coin)),
          Expanded(child: _PriceChange(coin)),
          Expanded(child: _CurrenPrice(coin)),
          Expanded(child: _SeeMoreButton(coin)),
        ],
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
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Container(
          constraints: const BoxConstraints(maxHeight: 30),
          child: Image(
            image: NetworkImage(coin.image),
            width: 30,
          )),
    );
  }
}

// nombre moneda
class _CoinName extends StatelessWidget {
  late final Coin coin;

  _CoinName(this.coin);

  @override
  Widget build(BuildContext context) {
    return Text(coin.name, style: Theme.of(context).textTheme.bodyText1);
  }
}

// cambio de precio en 24h
class _PriceChange extends StatelessWidget {
  late final Coin coin;

  _PriceChange(this.coin);

  @override
  Widget build(BuildContext context) {
    return Text(
      coin.priceChangePercentage24H.toString() + '%',
      style: GoogleFonts.montserrat(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          color: coin.priceChangePercentage24H < 0 ? Colors.red : Colors.green),
    );
  }
}

// precio actual
class _CurrenPrice extends StatelessWidget {
  late final Coin coin;

  _CurrenPrice(this.coin);

  @override
  Widget build(BuildContext context) {
    return Text('\$' + coin.currentPrice.toString(),
        style: Theme.of(context).textTheme.bodyText1);
  }
}

class _SeeMoreButton extends StatelessWidget {
  late final Coin coin;

  _SeeMoreButton(this.coin);

  @override
  Widget build(BuildContext context) {
    /**
     * al momento de 
     */
    late ChartService coinName =
        Provider.of<ChartService>(context, listen: false);

    return IconButton(
        // llamar la instacia del widget para los detalles de al moneda solo sería el body, nombre desde el appbar
        // pasar la moneda para conservar la info y no realizar otra petición http
        onPressed: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => XDH(coin)),
              ),
              coinName.setCoinName = coin.id,
            },
        icon: ImageIcon(
          const AssetImage('assets/img/plus.png'),
          color: HexColor("#4054E9"),
          size: 20.0,
        ));
  }
}
