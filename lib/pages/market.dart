import 'package:e_coin/models/coins.dart';
import 'package:e_coin/services/market_data.dart';
import 'package:e_coin/widgets/customAppbar.dart';
import 'package:e_coin/widgets/listaTop.dart';
import 'package:e_coin/widgets/no_connection.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class Market extends StatefulWidget {
  const Market({Key? key}) : super(key: key);

  @override
  State<Market> createState() => _MarketState();
}

class _MarketState extends State<Market> with AutomaticKeepAliveClientMixin {
  // listado de monedas y coincidencias
  List<Coin>? coinsToogle = [];
  List<Coin>? matchCoins = [];
  // listado de monedas desde una instancia del servicio
  CoinsDataAll coinsDataAll = CoinsDataAll();
  late Future<List<Coin>?> data;
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
    data = coinsDataAll.getCoins();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarspl("Mercado", context),
        // check for internet connection
        body: (internetState == true)
            ? FutureBuilder<List<Coin>?>(
                future: data,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    final error = snapshot.error;
                    return Text('nav to error');
                  } else if (snapshot.hasData) {
                    List<Coin>? coins = snapshot.data;
                    coinsToogle = coins;
                    return RefreshIndicator(
                      onRefresh: () async {
                        setState(() {
                          data = coinsDataAll.getCoins();
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.all(10.0),
                        child: ListView(
                          children: <Widget>[
                            // barra de búsqueda
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: TextField(
                                onChanged: (value) => filtrar(value),
                                decoration: InputDecoration(
                                    iconColor: Colors.black,
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 10.0),
                                    fillColor: Colors.white,
                                    filled: true,
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        borderSide: BorderSide(
                                            width: 1.2,
                                            color: HexColor('#4054E9'))),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        borderSide: BorderSide(
                                            width: 1,
                                            color: HexColor('#747E98'))),
                                    hintText: 'Buscar',
                                    prefixIcon: const Icon(
                                      Icons.search_rounded,
                                      size: 25.0,
                                    )),
                              ),
                            ),
                            Container(
                              child: Text('Monedas',
                                  style: Theme.of(context).textTheme.headline3),
                              margin: const EdgeInsets.only(
                                  top: 10.0, bottom: 10.0),
                            ),
                            // listado de monedas
                            matchCoins!.isEmpty
                                ? ListaTop(coins!)
                                : ListaTop(matchCoins!),
                          ],
                        ),
                      ),
                      displacement: 40.0,
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

  // filtrar la info de la barra
  void filtrar(String keyword) {
    List<Coin>? resultados = [];

    if (keyword.isEmpty) {
      resultados = coinsToogle;
    } else {
      resultados = coinsToogle
          ?.where(
              (coin) => coin.name.toLowerCase().contains(keyword.toLowerCase()))
          .toList();
    }

    setState(() {
      matchCoins = resultados;
    });
  }

  @override
  bool get wantKeepAlive => true;
}