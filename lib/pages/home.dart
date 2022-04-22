import 'package:e_coin/services/coins_data.dart';
import 'package:e_coin/widgets/customAppbar.dart';
import 'package:e_coin/widgets/listaTop.dart';
import 'package:e_coin/widgets/no_connection.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../models/coins.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> with AutomaticKeepAliveClientMixin {
  // coins list from service
  CoinsData coinsData = CoinsData();
  late Future<List<Coin>?> data;
  // internet checker
  bool internetState = true;
  // resolutions
  bool isOldScreen(BuildContext context) =>
      MediaQuery.of(context).size.width <= 480;

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
    data = coinsData.getCoins();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBars(),
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
                    return RefreshIndicator(
                      onRefresh: () async {
                        setState(() {
                          data = coinsData.getCoins();
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.all(10.0),
                        child: ListView(
                          children: <Widget>[
                            Container(
                              child: Text(grettings(),
                                  style: Theme.of(context).textTheme.headline1),
                              //height: 50.0,
                              margin: const EdgeInsets.only(
                                  top: 10.0, bottom: 40.0),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Image(
                                    image: const AssetImage(
                                        'assets/img/crypto.png'),
                                    width: (isOldScreen(context)) ? 60 : 90),
                                Text(
                                    'Obtén la información más \nimportante al momento',
                                    maxLines: 2,
                                    style:
                                        Theme.of(context).textTheme.headline3)
                              ],
                            ),
                            Container(
                              child: Text('El top 20',
                                  style: Theme.of(context).textTheme.headline3),
                              margin: const EdgeInsets.only(
                                  bottom: 10.0, top: 40.0),
                            ),
                            ListaTop(coins!),
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

  String grettings() {
    var hour = DateTime.now().hour;

    if (hour >= 6 && hour <= 12) {
      return 'Buenos días!';
    } else if (hour > 12 && hour < 19) {
      return 'Buenas tardes!';
    } else {
      return 'Buenas noches!';
    }
  }

  @override
  bool get wantKeepAlive => true;
}
