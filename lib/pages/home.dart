import 'package:e_coin/widgets/customAppbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars(),
      body: Container(
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
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
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
