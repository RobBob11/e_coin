import 'package:e_coin/models/chart_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

import '../../main.dart';

class Chart extends StatelessWidget {
  // lista de datos moldeados
  late List<ChartSampleData> chartData;
  // para hacer un seguimiento de la grafica
  late TrackballBehavior _trackballBehavior;

  Chart(this.chartData, this._trackballBehavior);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300.0,
        child: SfCartesianChart(
          plotAreaBorderColor: Colors.transparent,
          title: ChartTitle(
              text: 'Gráfico OHLC',
              textStyle: Theme.of(context).textTheme.headline3),
          legend: Legend(isVisible: false),
          trackballBehavior: _trackballBehavior,
          series: <CandleSeries>[
            CandleSeries<ChartSampleData, DateTime>(
                dataSource: chartData,
                name: 'COIN-DATA',
                xValueMapper: (ChartSampleData sales, _) => sales.x,
                lowValueMapper: (ChartSampleData sales, _) => sales.low,
                highValueMapper: (ChartSampleData sales, _) => sales.high,
                openValueMapper: (ChartSampleData sales, _) => sales.open,
                closeValueMapper: (ChartSampleData sales, _) => sales.close)
          ],
          primaryXAxis: DateTimeAxis(
              isVisible: false,
              dateFormat: DateFormat.yMd(),
              majorGridLines: const MajorGridLines(width: 0)),
          primaryYAxis: NumericAxis(
              isVisible: false,
              numberFormat: NumberFormat.simpleCurrency(decimalDigits: 0)),
        ));
  }
}
