import 'package:e_coin/services/chart_data.dart';
import 'package:e_coin/widgets/chart.dart';
import 'package:e_coin/widgets/chart_buttons.dart';
import 'package:e_coin/widgets/coin_details.dart';
import 'package:e_coin/widgets/customAppbar.dart';
import 'package:e_coin/widgets/no_connection.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../models/coins.dart';

class XDH extends StatefulWidget {
  late final Coin coin;

  XDH(this.coin);

  @override
  State<XDH> createState() => _XDHState();
}

class _XDHState extends State<XDH> {
  late TrackballBehavior _trackballBehavior;
  // internet checker
  bool internetState = true;

  @override
  void initState() {
    _trackballBehavior = TrackballBehavior(
        enable: true, activationMode: ActivationMode.singleTap);
    super.initState();
    // call internet connection checker method
    InternetConnectionChecker().onStatusChange.listen((status) {
      final hasInternet = (status == InternetConnectionStatus.connected);
      setState(() {
        internetState = hasInternet;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final chartData = Provider.of<ChartService>(context).chartObjects;
    final loading = Provider.of<ChartService>(context, listen: false).isLoading;

    return Scaffold(
        appBar: AppBarsCoins(widget.coin.name, context),
        body: (internetState == true)
            ? (loading == true)
                ? const Center(
                    child: Image(
                    image: AssetImage('assets/img/loadingDataTr.gif'),
                    width: 80,
                  ))
                : ListView(
                    children: <Widget>[
                      ListaDetalles(widget.coin),
                      Chart(chartData, _trackballBehavior),
                      DurationsList(widget.coin),
                    ],
                  )
            : const NoConnection());
  }
}
