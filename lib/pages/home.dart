import 'package:e_coin/widgets/customAppbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import '../models/coins.dart';
import '../widgets/listaTop.dart';

final _URL =
    'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=20&page=1&sparkline=false';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // listado de monedas
  List<Coin> coins = [];

  @override
  void initState() {
    reload();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars(),
      body: RefreshIndicator(
        onRefresh: reload,
        child: Container(
          margin: const EdgeInsets.all(10.0),
          child: ListView(
            children: <Widget>[
              Container(
                child: Text(grettings(),
                    style: GoogleFonts.montserrat(
                        fontSize: 24, fontWeight: FontWeight.w600)),
                //height: 50.0,
                margin: EdgeInsets.only(top: 10.0, bottom: 40.0),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      child: Image(
                          image: AssetImage('assets/img/crypto.png'),
                          width: 90.0),
                    ),
                    Container(
                      child: Text(
                          'Obtén la información más \nimportante al momento',
                          maxLines: 2,
                          style: GoogleFonts.montserrat(
                              fontSize: 18, fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
              ),
              Container(
                child: Text('El top 20',
                    style: GoogleFonts.montserrat(
                        fontSize: 18, fontWeight: FontWeight.w500)),
                //height: 50.0,
                margin: EdgeInsets.only(bottom: 10.0, top: 40.0),
              ),
              ListaTop(coins),
            ],
          ),
        ),
        displacement: 60.0,
      ),
    );
  }

  //servicio top 20 monedas
  Future reload() async {
    try {
      final url = Uri.parse(_URL);
      final response = await http.get(url);
      final dta = coinFromJson(response.body);
      coins = [];
      setState(() {
        coins.addAll(dta);
      });
      print(coins.length);
    } catch (error) {
      print(error);
    }
  }

  // metodo para los saludos
  String grettings() {
    var hour = DateTime.now().hour;

    if (hour >= 6 && hour <= 12) {
      return 'Buenos días!';
    } else if (hour > 12 && hour <= 19) {
      return 'Buenas tardes!';
    } else {
      return 'Buenas noches!';
    }
  }
}
