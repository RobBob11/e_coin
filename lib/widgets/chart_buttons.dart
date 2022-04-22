import 'package:e_coin/services/chart_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import '../models/chart_duration.dart';
import '../models/coins.dart';

class DurationsList extends StatelessWidget {
  late final Coin coin;

  DurationsList(this.coin);

  @override
  Widget build(BuildContext context) {
    // obtener el listado de duraciones
    final durations = Provider.of<ChartService>(context).durationsData;

    return Container(
      height: 80,
      child: Center(
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: durations.length,
          itemBuilder: (BuildContext context, int i) {
            return Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  _DurationButton(durations[i], this.coin),
                  const SizedBox(height: 5),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _DurationButton extends StatelessWidget {
  final DurationData duration;
  late final Coin coin;

  _DurationButton(this.duration, this.coin);

  @override
  Widget build(BuildContext context) {
    // llamar la instancia de provider de la clase
    final chartDataService = Provider.of<ChartService>(context);
    chartDataService.chartData = [];
    chartDataService.chartObjects = [];
    return Center(
      child: GestureDetector(
        onTap: () {
          // llamar la instancia de provider de la clase del método en false para q no genere error al no estar en init
          final chartDataService =
              Provider.of<ChartService>(context, listen: false);
          // configurar la duración al dar click para provider
          chartDataService.setDuration = duration.durationData;
          // eliminar los datos anteriores --> cambiar
          chartDataService.chartData = [];
          chartDataService.chartObjects = [];
        },
        child: Card(
          color: (chartDataService.duration == duration.durationData)
              ? HexColor('#4054E9')
              : HexColor('FFFFFF'),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100.0)),
          margin: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Container(
            width: 40.0,
            height: 40.0,
            child: Center(
                child: Text(duration.label,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black))),
          ),
        ),
      ),
    );
  }
}
